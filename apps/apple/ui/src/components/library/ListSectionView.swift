import SwiftUI

public struct ListSectionView<Children: View>: View {
  let title: String?
  let children: Children

  public init(title: String? = nil, @ViewBuilder children: () -> Children) {
    self.title = title
    self.children = children()
  }

  public var body: some View {
    if let title {
      Section(title) {
        children
      }
    } else {
      Section {
        children
      }
    }
  }
}

struct ListSectionView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      ListSectionView(title: "Section 1") {
        Text("Row 1.1")
        Text("Row 1.2")
      }
      ListSectionView(title: "Section 2") {
        Text("Row 2.1")
        Text("Row 2.2")
      }
    }
  }
}
