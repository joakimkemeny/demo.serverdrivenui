import SwiftUI

public struct DataListItemView: View {
  let icon: Icon?
  let heading: String?
  let label: String
  let value: String?
  let clientUrl: String?

  public init(
    icon: Icon? = nil,
    heading: String? = nil,
    label: String,
    value: String? = nil,
    clientUrl: String? = nil
  ) {
    self.icon = icon
    self.heading = heading
    self.label = label
    self.value = value
    self.clientUrl = clientUrl
  }

  public var body: some View {
    let content = VStack(alignment: .leading) {
      if let heading {
        Text(heading)
          .padding(.vertical, 6)
          .padding(.horizontal, 12)
          .foregroundStyle(.white)
          .background(Color(red: 0.56, green: 0.59, blue: 0.54))
          .font(.subheadline)
          .clipShape(Capsule())
      }
      HStack {
        if let icon {
          Label(label, systemImage: icon.systemImage)
            .accentColor(.red)
        } else {
          Text(label)
        }
        if let value {
          Spacer()
          Text(value).foregroundStyle(.gray).font(.subheadline)
        }
      }
    }

    if let clientUrl {
      return AnyView(NavigationLink(value: clientUrl) {
        content
      })
    } else {
      return AnyView(content)
    }
  }
}

struct DataListItemView_Previews: PreviewProvider {
  static var previews: some View {

    NavigationStack {
      ListView(title: "Test", children: {
        DataListItemView(
          heading: "12 Maj 2023",
          label: "Withdrawal for Car Repair",
          value: "-5 000 kr"
        )
        DataListItemView(
          icon: .arrowDown,
          label: "Withdrawal for Car Repair",
          value: "-5 000 kr"
        )
        DataListItemView(
          icon: .card,
          label: "Credit Card",
          value: "-5 000 kr",
          clientUrl: "/1234"
        )
      }, destinations: {
        Text("Test")
      })
    }
  }
}
