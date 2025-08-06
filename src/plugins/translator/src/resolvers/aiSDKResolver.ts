import type { TranslateResolver } from '@payload-enchants/translator/resolvers/types'

import { createGoogleGenerativeAI } from '@ai-sdk/google'
import { generateObject } from 'ai'
import { OpenAIPrompt } from '@payload-enchants/translator/resolvers/openAI'
import { z } from 'zod'
import { chunkArray } from '../utils/chunkArray'

export type AISDKResolverConfig = {
  apiKey: string
  provider?: string
  /**
   * How many texts to include into 1 request
   * @default 100
   */
  chunkLength?: number
  /**
   * @default "gemini-2.0-flash-exp"
   */
  model?: string
  prompt?: OpenAIPrompt
}

const translationSchema = z.object({
  translations: z.array(z.string()),
})

const defaultPrompt: OpenAIPrompt = ({ localeFrom, localeTo, texts }) => {
  return `Provide natural, idiomatic translations for the following texts from ${localeFrom} to ${localeTo}. Adapt phrasing to sound natural in the target language, avoiding literal word-for-word translations where they would be awkward. Note that 'بلّورة' is spelled as 'Ballurh' in English and 'بلّورة' in Arabic. Texts to translate: ${JSON.stringify(texts)}

Output in JSON format: {"translations": ["translated text 1", "translated text 2", ...]}`
}

export const aiSDKResolver = ({
  apiKey,
  provider = 'google',
  chunkLength = 100,
  model = 'gemini-2.0-flash-exp',
  prompt = defaultPrompt,
}: AISDKResolverConfig): TranslateResolver => {
  return {
    key: 'aiSDK',
    resolve: async ({ localeFrom, localeTo, req, texts }) => {
      try {
        if (!provider) {
          req.payload.logger.error('Provider is required for AI SDK resolver')
          return {
            success: false as const,
          }
        }

        let providerInstance: any

        if (provider === 'google') {
          providerInstance = createGoogleGenerativeAI({
            apiKey,
          })
        } else {
          req.payload.logger.error(`Provider ${provider} is not supported`)
          return {
            success: false as const,
          }
        }

        const response: {
          data: { translations: string[] }
          success: boolean
        }[] = await Promise.all(
          chunkArray(texts, chunkLength).map((textChunk: string[]) => {
            return generateObject({
              model: providerInstance(model),
              prompt: prompt({ localeFrom, localeTo, texts: textChunk }),
              schema: translationSchema,
            })
              .then(async (result) => {
                return {
                  data: { translations: result.object.translations },
                  success: true,
                }
              })
              .catch((error) => {
                req.payload.logger.info({
                  message: 'An error occurred when trying to translate the data using AI SDK',
                  error: error.message,
                })
                return {
                  data: { translations: [] },
                  success: false,
                }
              })
          }),
        )

        const translated: string[] = []

        for (const { data, success } of response) {
          if (!success) {
            return {
              success: false as const,
            }
          }

          const translatedChunk = data?.translations

          if (!translatedChunk) {
            req.payload.logger.error(
              'An error occurred when trying to translate the data using AI SDK - missing translations in the response',
            )
            return {
              success: false as const,
            }
          }

          if (!Array.isArray(translatedChunk)) {
            req.payload.logger.error({
              data: translatedChunk,
              message:
                'An error occurred when trying to translate the data using AI SDK - translations is not an array',
            })
            return {
              success: false as const,
            }
          }

          for (const text of translatedChunk) {
            if (text && typeof text !== 'string') {
              req.payload.logger.error({
                chunkData: translatedChunk,
                data: text,
                message:
                  'An error occurred when trying to translate the data using AI SDK - translation is not a string',
              })
              return {
                success: false as const,
              }
            }

            translated.push(text)
          }
        }

        return {
          success: true as const,
          translatedTexts: translated,
        }
      } catch (e) {
        if (e instanceof Error) {
          req.payload.logger.info({
            message: 'An error occurred when trying to translate the data using AI SDK',
            originalErr: e.message,
          })
        }

        return { success: false as const }
      }
    },
  }
}
