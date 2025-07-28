import type { Payload, PayloadRequest } from 'payload'
import type { Changelog } from '@/payload-types' // Assuming Changelog type exists

export const seedChangelog = async (payload: Payload, req: PayloadRequest): Promise<void> => {
  const changelogCount = 10
  const changelogDataArray = Array.from({ length: changelogCount }).map(
    (_, i) =>
      ({
        title: `Changelog Entry ${i + 1}`,
        date: new Date().toISOString(),
        version: `1.0.${i + 1}`,
        description: {
          root: {
            type: 'root',
            children: [
              {
                type: 'paragraph',
                version: 1,
                children: [{ text: `Desc for changelog ${i + 1}` }],
              },
            ],
            direction: 'rtl' as 'rtl' | 'ltr' | null,
            format: '',
            indent: 0,
            version: 1,
          },
        }, // Simplified
        categories: ['feature', 'improvement'] as (
          | 'bug-fix'
          | 'feature'
          | 'improvement'
          | 'security'
          | 'other'
        )[],
      }) as Omit<Changelog, 'id' | 'updatedAt' | 'createdAt'>,
  )

  const changelogPromises = changelogDataArray.map(async (clData) => {
    try {
      return await payload.create({
        collection: 'changelog',
        depth: 0,
        data: clData,
        req,
      })
    } catch (error) {
      payload.logger.error(
        `Failed to create changelog entry ${clData.title}: ${error instanceof Error ? error.message : String(error)}`,
      )
      return null
    }
  })
  await Promise.all(changelogPromises)
}
