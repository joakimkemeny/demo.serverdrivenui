import SwiftUI

extension View {
  func isInWidget() -> Bool {
    guard let bundle = Bundle.main.infoDictionary?["NSExtension"] as? [String: String] else {
      return false
    }
    guard let widget = bundle["NSExtensionPointIdentifier"] else { return false }
    return widget == "com.apple.widgetkit-extension"
  }
}
