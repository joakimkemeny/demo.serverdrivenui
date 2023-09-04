import { ReactNode } from "react"
import styled from "styled-components"
import { ComponentRenderer } from "../internal/ComponentRenderer"

type Props = {
  destinations?: any
  children: ReactNode
  title: String
}

const Container = styled.section`
  display: flex;
  gap: 30px;

  h1 {
    font-size: 2rem;
    font-weight: 400;
    margin-bottom: 1rem;
  }
`

const StyledUl = styled.ul`
  margin: 0;
  padding: 0;
  & > li {
    list-style: none;
    margin: 0;
  }
  padding-right: 50px;
  min-width: 350px;
`

export function List({ destinations, children, title }: Props) {
  return (
    <Container>
      <div>
        <h1>{title}</h1>
        <StyledUl>{children}</StyledUl>
      </div>
      {destinations?.map((destination: any) => <ComponentRenderer component={destination} />)}
    </Container>
  )
}
