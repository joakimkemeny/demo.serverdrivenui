import { createGlobalStyle } from "styled-components"

export const GlobalReset = createGlobalStyle`
  @layer reset {
    /* Thanks to Joshua Comeau and Stephanie Eckles for reset ideas */
    /* https://www.joshwcomeau.com/css/custom-css-reset */
    /* https://moderncss.dev/modern-css-for-dynamic-component-based-architecture */
    *,
    *::before,
    *::after {
      box-sizing: border-box;
    }

    * {
      line-height: calc(1em + 0.5rem);
      margin: 0;
    }

    a {
      text-decoration-thickness: max(0.08em, 1px);
      text-underline-offset: 0.15em;
    }

    body {
      -moz-osx-font-smoothing: grayscale;
      -webkit-font-smoothing: antialiased;
      text-size-adjust: none;
    }

    canvas,
    img,
    picture,
    svg,
    video {
      display: block;
      max-width: 100%;
    }

    button,
    input,
    select,
    textarea {
      font: inherit;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    p {
      overflow-wrap: break-word;
    }
  }
`
