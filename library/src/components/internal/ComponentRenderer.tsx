import type { FunctionComponent, ReactElement, ReactNode } from "react"
import { Children } from "react"
import { ComponentDefinition } from "../../jsx/jsx-runtime"
import * as components from "../library"

type Props = {
  component?: ComponentDefinition
  children?: ReactNode
}

let componentCreators: Record<string, FunctionComponent<any>> = components

export function ComponentRenderer({ component, children }: Props) {
  function deserialize(componentDefinition: ComponentDefinition): ReactElement | null {
    return renderChildren(componentDefinition) as ReactElement
  }

  function renderChildren(
    componentDefinition: ComponentDefinition | string | number,
  ): ReactNode | null {
    if (!componentDefinition) {
      return null
    }

    if (typeof componentDefinition === "string") {
      return componentDefinition as string
    } else if (typeof componentDefinition === "number") {
      return componentDefinition as number
    }

    let children: ReactNode[] | ReactNode | null =
      componentDefinition?.children?.map(renderChildren)
    if (Array.isArray(children)) {
      if (children.length === 1) {
        children = children[0]
      } else {
        children = Children.toArray(children) // needed to auto add keys
      }
    }

    const ComponentCreator = componentCreators[componentDefinition?.name]
    if (ComponentCreator !== undefined) {
      return (
        <ComponentCreator key={componentDefinition.key} {...componentDefinition.props}>
          {children}
        </ComponentCreator>
      )
    } else {
      throw Error(`Component '${componentDefinition.name}' not found`)
    }
  }

  return component === undefined ? children : deserialize(component)
}
