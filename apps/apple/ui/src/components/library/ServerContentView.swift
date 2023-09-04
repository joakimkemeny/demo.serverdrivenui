import SwiftUI

public struct ServerContentView<Children: View>: View {
  let clientUrl: String?
  let serverUrl: String
  let children: (() -> Children)?

  @StateObject var httpClient = HttpClient()
  @Environment(\.currentRoute) var currentRoute

  public init(
    clientUrl: String? = nil,
    serverUrl: String,
    @ViewBuilder children: @escaping () -> Children
  ) {
    self.clientUrl = clientUrl
    self.serverUrl = serverUrl
    self.children = children
  }

  public var body: some View {
    if let clientUrl {
      if currentRoute.wrappedValue.contains(clientUrl) {
        ComponentRendererView(json: httpClient.data, children: children)
          .task { await httpClient.get(serverUrl) }
          .refreshable { await httpClient.get(serverUrl, force: true) }
      }
    } else {
      ComponentRendererView(json: httpClient.data, children: children)
        .task { await httpClient.get(serverUrl) }
        .refreshable { await httpClient.get(serverUrl, force: true) }
    }
  }
}

public extension ServerContentView where Children == EmptyView {
  init(clientUrl: String? = nil, serverUrl: String) {
    self.clientUrl = clientUrl
    self.serverUrl = serverUrl
    children = nil
  }
}
