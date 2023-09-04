import Foundation

class ComponentDefinition: Codable, Identifiable {
  var name: ComponentType
  var props: ComponentProps?
  var children: [ComponentChild]?
  var key: String = UUID().uuidString

  var id: String { key }

  enum ComponentType: String, Codable {
    case DataListItem
    case List
    case ListSection
    case Login
    case ServerContent
    case Text
    case Widget
    case WidgetListItem
  }

  class ComponentProps: Codable {
    var actionLabel: String?
    var actionIcon: Icon?
    var actionClientUrl: String?
    var actionServerUrl: String?
    var clientUrl: String?
    var heading: String?
    var icon: Icon?
    var intro: String?
    var label: String?
    var text: String?
    var serverUrl: String?
    var skeleton: Bool?
    var title: String?
    var value: String?
    var destinations: [ComponentChild]?
  }

  enum CodingKeys: String, CodingKey {
    case name
    case props
    case children
  }
}

enum ComponentChild: Codable, Identifiable {
  case component(ComponentDefinition)
  case string(String)

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let item = try? container.decode(ComponentDefinition.self) {
      self = .component(item)
    } else if let item = try? container.decode(String.self) {
      self = .string(item)
    } else {
      throw DecodingError.dataCorrupted(.init(
        codingPath: decoder.codingPath, debugDescription: "Not a component or string"
      ))
    }
  }

  var id: String {
    switch self {
      case let .component(value): value.key
      case let .string(value): value
    }
  }
}
