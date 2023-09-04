import SwiftUI

struct ComponentFactory {
  private let component: ComponentChild

  init(component: ComponentChild) {
    self.component = component
  }

  @ViewBuilder func dataListItem(component: ComponentDefinition) -> some View {
    if let label = component.props?.label {
      DataListItemView(
        icon: component.props?.icon,
        heading: component.props?.heading,
        label: label,
        value: component.props?.value,
        clientUrl: component.props?.clientUrl
      )
    } else {
      Text("Invalid 'DataListItem'")
    }
  }

  @ViewBuilder func list(component: ComponentDefinition) -> some View {
    if let children = component.children,
       let title = component.props?.title {
      ListView(title: title, children: {
        ForEach(children) { child in
          ComponentFactory(component: child).render()
        }
      }, destinations: {
        Group {
          if let destinations = component.props?.destinations {
            ForEach(destinations) { destination in
              ComponentFactory(component: destination).render()
            }
          }
        }
      })
    } else {
      Text("Invalid 'List'")
    }
  }

  @ViewBuilder func listSection(component: ComponentDefinition) -> some View {
    if let children = component.children,
       let title = component.props?.title {
      ListSectionView(title: title) {
        ForEach(children) { child in
          ComponentFactory(component: child).render()
        }
      }
    } else {
      Text("Invalid 'ListSection'")
    }
  }

  @ViewBuilder func login(component: ComponentDefinition) -> some View {
    if let title = component.props?.title,
       let intro = component.props?.intro,
       let actionLabel = component.props?.actionLabel,
       let actionIcon = component.props?.actionIcon,
       let actionClientUrl = component.props?.actionClientUrl,
       let actionServerUrl = component.props?.actionServerUrl {
      LoginView(
        title: title,
        intro: intro,
        actionLabel: actionLabel,
        actionIcon: actionIcon,
        actionClientUrl: actionClientUrl,
        actionServerUrl: actionServerUrl
      )
    } else {
      Text("Invalid 'Login'")
    }
  }

  @ViewBuilder func serverContent(component: ComponentDefinition) -> some View {
    if let serverUrl = component.props?.serverUrl {
      if let children = component.children {
        ServerContentView(clientUrl: component.props?.clientUrl, serverUrl: serverUrl) {
          ForEach(children) { child in
            ComponentFactory(component: child).render()
          }
        }
      } else {
        ServerContentView(clientUrl: component.props?.clientUrl, serverUrl: serverUrl)
      }
    } else {
      Text("Invalid 'ServerContent'")
    }
  }

  @ViewBuilder func text(component: ComponentDefinition) -> some View {
    if let text = component.props?.text {
      TextView(text: text)
    } else {
      Text("Invalid 'Text'")
    }
  }

  @ViewBuilder func widget(component: ComponentDefinition) -> some View {
    if let icon = component.props?.icon,
       let label = component.props?.label,
       let value = component.props?.value,
       let skeleton = component.props?.skeleton {
      WidgetView(icon: icon, label: label, value: value, skeleton: skeleton)
    } else {
      Text("Invalid 'Widget'")
    }
  }

  @ViewBuilder func widgetListItem(component: ComponentDefinition) -> some View {
    if let children = component.children {
      WidgetListItemView {
        ForEach(children) { child in
          ComponentFactory(component: child).render()
        }
      }
    } else {
      Text("Invalid 'WidgetListItem'")
    }
  }

  @ViewBuilder func buildDefault() -> some View {
    switch component {
      case let .component(component):
        switch component.name {
          case .DataListItem: dataListItem(component: component)
          case .List: list(component: component)
          case .ListSection: listSection(component: component)
          case .Login: login(component: component)
          case .ServerContent: serverContent(component: component)
          case .Text: text(component: component)
          case .Widget: widget(component: component)
          case .WidgetListItem: widgetListItem(component: component)
        }
      default: Text("Unknown")
    }
  }

  @ViewBuilder func render() -> some View {
    AnyView(buildDefault())
  }
}
