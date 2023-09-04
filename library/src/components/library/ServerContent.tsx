import { ReactNode, useEffect, useState } from "react"
import { Route, Routes } from "react-router-dom"
import { ComponentDefinition } from "../../jsx/jsx-runtime"
import { ComponentRenderer } from "../internal/ComponentRenderer"

type Props = {
  clientUrl?: string
  serverUrl: string
  children?: ReactNode
}

export function ServerContent({ children, clientUrl, serverUrl }: Props) {
  const [data, setData] = useState<ComponentDefinition | undefined>(undefined)

  async function loadData() {
    if (data === undefined && serverUrl) {
      const result = await fetch(serverUrl, { method: "GET" })
      const json = (await result.json()) as ComponentDefinition
      setData(json)
    }
  }

  useEffect(() => {
    loadData()
  }, [serverUrl])

  const component = <ComponentRenderer component={data}>{children}</ComponentRenderer>

  if (clientUrl === undefined) {
    return component
  } else {
    return (
      <Routes>
        <Route path={clientUrl} element={component} />
      </Routes>
    )
  }
}
