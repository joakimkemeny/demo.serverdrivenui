export type ComponentDefinition = {
  name: string
  props?: any
  children?: (ComponentDefinition | string | number)[]
  key?: string | number
}

const Fragment = () => null

function jsx(tag: any, { children, ...props }: any, key: any): ComponentDefinition {
  const tagName = tag.name

  if (tagName === undefined) {
    throw Error(`Invalid tag '${tag}'. Only custom elements are allowed.`)
  }

  if (!Object.keys(props).length) {
    props = undefined
  }

  if (!children) {
    children = undefined
  } else if (!Array.isArray(children)) {
    children = [children]
  }

  return {
    name: tagName,
    props: props,
    children: children?.filter((c: any) => c !== null),
    key,
  }
}

export { Fragment, jsx, jsx as jsxDEV, jsx as jsxs }
