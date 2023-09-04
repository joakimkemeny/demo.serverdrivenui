import SwiftUI

public struct ListView<Destinations: View, Children: View>: View {
  let title: String
  let children: Children
  let destinations: Destinations?

  public init(
    title: String,
    @ViewBuilder children: () -> Children,
    destinations: (() -> Destinations)? = nil
  ) {
    self.title = title
    self.children = children()
    self.destinations = destinations?()
  }

  public var body: some View {
    List {
      children
    }
    .navigationTitle(title)
    .navigationDestination(for: String.self) { route in
      destinations
        .environment(\.currentRoute, .constant(route))
    }
  }
}

extension ListView where Destinations == EmptyView {
  init(title: String, @ViewBuilder children: () -> Children) {
    self.title = title
    self.children = children()
    destinations = nil
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView(title: "Demo") {
      Text("Test 1")
      Text("Test 2")
    }
    NavigationStack {
      ListView(title: "Demo", children: {
        NavigationLink("Test 1", value: "1")
        NavigationLink("Test 2", value: "2")
      }, destinations: {
        Text("Test 3")
      })
    }
  }
}
