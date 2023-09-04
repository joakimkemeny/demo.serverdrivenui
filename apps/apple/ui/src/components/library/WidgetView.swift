import SwiftUI

public struct WidgetView: View {
  let icon: Icon
  let label: String
  let value: String
  let skeleton: Bool

  public init(icon: Icon, label: String, value: String, skeleton: Bool = false) {
    self.icon = icon
    self.label = label
    self.value = value
    self.skeleton = skeleton
  }

  public var body: some View {
    VStack(alignment: .center) {
      Image(systemName: icon.systemImage)
        .font(.largeTitle)
        .foregroundColor(Color(red: 0.79, green: 0.23, blue: 0.46))
        .padding(.bottom)
      Text(label.uppercased())
        .font(.caption)
      Text(value)
        .font(.title2)
    }
    .redacted(reason: skeleton ? .placeholder : [])
    .frame(maxWidth: .infinity)
    .padding(.vertical)
    .background(isInWidget() ? Color.clear : .white)
    .clipShape(RoundedRectangle(cornerRadius: 8))
  }
}

struct WidgetView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      WidgetView(icon: .arrowUp, label: "Total Debt", value: "34 950 kr")
    }
    .padding()
    .background(Color(uiColor: .secondarySystemBackground))
    .previewLayout(.fixed(width: 170, height: 170))
    .previewDisplayName("Total Debt")

    VStack {
      WidgetView(icon: .arrowUp, label: "Total Debt", value: "34 950 kr")
    }
    .padding()
    .background(Color(uiColor: .secondarySystemBackground))
    .previewLayout(.fixed(width: 170, height: 170))
    .previewDisplayName("Total Savings")

    VStack {
      WidgetView(icon: .arrowUp, label: "Total Debt", value: "34 950 kr", skeleton: true)
    }
    .padding()
    .background(Color(uiColor: .secondarySystemBackground))
    .previewLayout(.fixed(width: 170, height: 170))
    .previewDisplayName("Skeleton")
  }
}
