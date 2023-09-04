import { createGlobalStyle } from "styled-components"

export const GlobalBase = createGlobalStyle`
  @layer base {
    html {
      font-family: system-ui;
      font-size: 100%;
      font-weight: 400;
      height: 100%;
    }

    body {
      background-color: var(--background-color);
      display: flex;
      height: 100%;
    }

    :is(button, input, div):focus-visible {
      outline: 3px solid var(--pink-dark);
      outline-offset: 1px;
    }

    body > :first-child {
      padding: 50px;
      margin: 0 auto;
    }
  }
`
