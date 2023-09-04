import SwiftUI

@MainActor
class HttpClient: ObservableObject {
  @Published var data: Data? = nil

  func get(_ url: String, force: Bool = false) async {
    let url = URL(string: url)!
    let urlSession = URLSession.shared

    urlSession.configuration.requestCachePolicy = .returnCacheDataElseLoad

    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    do {
      if data == nil || force {
        let (data, _) = try await urlSession.data(for: request)
        self.data = data
      }
    } catch {
      debugPrint("Error loading \(url): \(String(describing: error))")
    }
  }
}
