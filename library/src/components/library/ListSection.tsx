import { ReactNode } from "react"
import styled from "styled-components"

type Props = {
  title: string
  children: ReactNode
}

const StyledList = styled.ul`
  background-color: white;
  border-radius: 8px;
  box-shadow:
    0 1px 1px hsl(0deg 0% 0% / 0.035),
    0 2px 2px hsl(0deg 0% 0% / 0.035),
    0 4px 4px hsl(0deg 0% 0% / 0.035),
    0 8px 8px hsl(0deg 0% 0% / 0.035),
    0 16px 16px hsl(0deg 0% 0% / 0.035);
  padding: 0;
  margin: 16px 0;
`
const StyledH2 = styled.h2`
  color: var(--label-color);
  font-size: 0.8rem;
  margin: 20px 0 -10px 0;
  text-transform: uppercase;
  font-weight: 400;
`

export function ListSection({ title, children }: Props) {
  return (
    <>
      <StyledH2>{title}</StyledH2>
      <StyledList>{children}</StyledList>
    </>
  )
}
