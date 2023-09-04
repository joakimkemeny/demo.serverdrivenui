import SwiftUI

public struct AccountsScreen: View {

  public init() {}

  public var body: some View {
    ListView(title: "Accounts", children: {
      WidgetListItemView {
        WidgetView(icon: .arrowDown, label: "Total Debt", value: "34 950 kr")
        WidgetView(icon: .arrowUp, label: "Total Savings", value: "110 240 kr")
      }
      ListSectionView(title: "Credit Cards") {
        DataListItemView(
          icon: .card,
          label: "Golden Advantage",
          value: "34 830 kr",
          clientUrl: "/accounts/1234567"
        )
        DataListItemView(
          icon: .card,
          label: "Platinum Prestige",
          value: "1 200 kr",
          clientUrl: "/accounts/2345678"
        )
      }
      ListSectionView(title: "Savings Accounts") {
        DataListItemView(
          icon: .money,
          label: "Rainy Day Reserves",
          value: "1 340 kr",
          clientUrl: "/accounts/3456789"
        )
        DataListItemView(
          icon: .money,
          label: "Adventure Awaits",
          value: "92 600 kr",
          clientUrl: "/accounts/4567890"
        )
        DataListItemView(
          icon: .money,
          label: "Future Home Haven",
          value: "16 300 kr",
          clientUrl: "/accounts/5678901"
        )
      }
    }, destinations: {
      Group {
        ServerContentView(clientUrl: "/accounts/1234567", serverUrl: "") {
          CreditCardAccountScreen()
        }
        ServerContentView(clientUrl: "/accounts/2345678", serverUrl: "") {
          CreditCardAccountScreen()
        }
        ServerContentView(clientUrl: "/accounts/3456789", serverUrl: "") {
          SavingsAccountScreen()
        }
        ServerContentView(clientUrl: "/accounts/4567890", serverUrl: "") {
          SavingsAccountScreen()
        }
        ServerContentView(clientUrl: "/accounts/5678901", serverUrl: "") {
          SavingsAccountScreen()
        }
      }
    })
  }
}

struct AccountsScreen_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      AccountsScreen()
    }
  }
}
