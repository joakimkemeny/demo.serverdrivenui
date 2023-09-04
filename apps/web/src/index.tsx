import { GlobalStyles, ServerContent } from "@sneakycash/library/web"
import React from "react"
import ReactDOM from "react-dom/client"
import { BrowserRouter } from "react-router-dom"

function App() {
  return (
    <>
      <ServerContent clientUrl="/" serverUrl={`${import.meta.env.SNEAKYCASH_SERVER_URL}/login`} />
      <ServerContent
        clientUrl="/accounts/*"
        serverUrl={`${import.meta.env.SNEAKYCASH_SERVER_URL}/accounts`}
      />
    </>
  )
}

ReactDOM.createRoot(document.getElementById("app") as HTMLElement).render(
  <React.StrictMode>
    <GlobalStyles />
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </React.StrictMode>,
)
