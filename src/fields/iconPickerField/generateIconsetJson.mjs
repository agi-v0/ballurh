import { promises as fs } from 'fs'
import { locate } from '@iconify/json'
import { parseIconSet, iconToSVG, iconToHTML } from '@iconify/utils'

// Function to generate the icons object and save it to a JSON file
async function generateIconsObjectAndSave(prefix, outputFilePath = 'icons.json') {
  try {
    // Get the path to the icon set JSON file
    const iconSetPath = locate(prefix)

    // Read and parse the JSON file
    const iconSetData = JSON.parse(await fs.readFile(iconSetPath, 'utf8'))

    // Initialize the object to store icon names and SVG strings
    const iconsObject = {}

    // Iterate through each icon in the set
    parseIconSet(iconSetData, (name, data) => {
      if (data) {
        // Generate SVG data (attributes and body)
        const svgData = iconToSVG(data)

        // Convert to an SVG string
        const svgString = iconToHTML(svgData.body, svgData.attributes)

        // Add to the object
        iconsObject[name] = svgString
      }
    })

    // Write the object to a JSON file
    await fs.writeFile(
      outputFilePath,
      JSON.stringify(iconsObject, null, 2), // Pretty-print with 2 spaces
      'utf8',
    )

    console.log(`Icons object successfully saved to ${outputFilePath}`)
    return iconsObject // Optionally return the object if needed
  } catch (error) {
    console.error(`Error generating or saving icons object for prefix "${prefix}":`, error)
    return {}
  }
}

// Example usage with 'lucide' (Lucide Icons)
generateIconsObjectAndSave('material-symbols', 'material-symbols-icons.json')
  .then((iconsObject) => {
    console.log('Generated object size:', Object.keys(iconsObject).length, 'icons')
  })
  .catch((error) => {
    console.error('Failed to generate and save icons object:', error)
  })
