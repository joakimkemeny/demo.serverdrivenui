import SwiftUI

public struct WidgetListItemView<Children: View>: View {
  let children: Children

  public init(@ViewBuilder children: () -> Children) {
    self.children = children()
  }

  public var body: some View {
    HStack(spacing: 16) {
      children
    }
    .listRowBackground(Color.clear)
    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    .listRowSeparator(.hidden)
  }
}

struct WidgetListItemView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      WidgetListItemView {
        WidgetView(icon: .arrowDown, label: "Total Debt", value: "34 950 kr")
        WidgetView(icon: .arrowUp, label: "Total Savings", value: "110 240 kr")
      }
    }
  }
}
