import SwiftUI

public struct RouteKey: EnvironmentKey {
  public static let defaultValue: Binding<String> = .constant("")
}

public extension EnvironmentValues {
  var currentRoute: Binding<String> {
    get { self[RouteKey.self] }
    set { self[RouteKey.self] = newValue }
  }
}
