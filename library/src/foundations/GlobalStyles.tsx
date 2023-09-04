import { createGlobalStyle } from "styled-components"
import { GlobalBase } from "./GlobalBase"
import { GlobalReset } from "./GlobalReset"
import { GlobalTokens } from "./GlobalTokens"

const Layers = createGlobalStyle`
  @layer reset, base, component, screen;
`

export function GlobalStyles() {
  return (
    <>
      <Layers />
      <GlobalTokens />
      <GlobalReset />
      <GlobalBase />
    </>
  )
}
