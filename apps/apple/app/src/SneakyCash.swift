import SwiftUI
import UI

@main
struct SneakyCash: App {
  @State var currentRoute = "/login"

  var body: some Scene {
    WindowGroup {
      ServerContentView(clientUrl: "/login", serverUrl: "\(Config.serverUrl)/login")

      if currentRoute.starts(with: "/accounts") {
        NavigationStack {
          ServerContentView(clientUrl: "/accounts", serverUrl: "\(Config.serverUrl)/accounts")
        }
        .tint(Color(red: 0.79, green: 0.23, blue: 0.46))
      }
    }
    .environment(\.currentRoute, $currentRoute)
  }
}
