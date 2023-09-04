import { ReactNode } from "react"
import styled from "styled-components"

type Props = {
  children: ReactNode
}

const StyledDiv = styled.div`
  display: flex;
  gap: 16px;
`

export function WidgetListItem({ children }: Props) {
  return <StyledDiv>{children}</StyledDiv>
}
