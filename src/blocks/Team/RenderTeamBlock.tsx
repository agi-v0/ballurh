import React from 'react'
import { TeamBlock } from '@/payload-types'

import { Team } from './variants/Team'

export const RenderTeamBlock: React.FC<TeamBlock> = (props) => {
  const TeamBlockComponent = Team

  return <TeamBlockComponent {...props} />
}
