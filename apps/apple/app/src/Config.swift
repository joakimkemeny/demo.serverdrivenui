import Foundation

enum Config {

  // MARK: - Helpers

  private static let info: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("plist file not found")
    }
    return dict
  }()

  private static let sneakyCash: [String: Any] = {
    guard let dict = Config.info["SneakyCash"] as? [String: Any] else {
      fatalError("plist file note found")
    }
    return dict
  }()

  // MARK: - Config

  static let serverUrl: String = {
    guard let string = Config.sneakyCash["SneakyCashServerUrl"] as? String else {
      fatalError("Server URL not set in plist")
    }
    return string
  }()
}
