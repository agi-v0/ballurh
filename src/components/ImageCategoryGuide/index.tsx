import React from 'react'
import './index.scss'

const categories = [
  {
    name: 'Hero Images',
    description:
      'Large banner-style visuals used at the top of pages (homepage, product landing, etc.).',
  },
  {
    name: 'Feature Images',
    description: 'Supporting visuals for product features, benefit sections, etc.',
  },
  {
    name: 'Blog Images',
    description: 'Thumbnails, headers, or inline visuals for blog posts.',
  },
  {
    name: 'OG Images',
    description: 'Open Graph images for social sharing previews (usually auto-picked per page).',
  },
  {
    name: 'Customer Logos',
    description: 'Logos of customers/clients used in trust or testimonial sections.',
  },
  {
    name: 'App Icons',
    description: 'Icons for 3rd-party services shown in integrations, partners, or use cases.',
  },
  {
    name: 'Team Photos',
    description: 'Profile images or portraits of team members for About or Leadership pages.',
  },
  {
    name: 'Background Textures',
    description: 'Subtle patterns, gradients, or decorative backgrounds used behind content.',
  },
]

const ImageCategoryGuide = (props: any) => {
  return (
    <div className="image-category-guide">
      <div className="field-description image-category-guide__description">
        Select the most appropriate category for the uploaded media. Refer to the guide below for
        default media categories and their typical usage.
      </div>
      <div className="image-category-guide__table-container">
        <table className="image-category-guide__table">
          <thead className="image-category-guide__table-header">
            <tr className="image-category-guide__table-row">
              <th className="image-category-guide__table-head image-category-guide__table-head--category">
                Category Name
              </th>
              <th className="image-category-guide__table-head">Description</th>
            </tr>
          </thead>
          <tbody className="image-category-guide__table-body">
            {categories.map((category) => (
              <tr key={category.name} className="image-category-guide__table-row">
                <td className="image-category-guide__table-cell image-category-guide__table-cell--category">
                  {category.name}
                </td>
                <td className="image-category-guide__table-cell">{category.description}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}

export default ImageCategoryGuide
