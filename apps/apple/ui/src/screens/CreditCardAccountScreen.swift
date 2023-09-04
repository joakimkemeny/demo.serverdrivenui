import SwiftUI

struct CreditCardAccountScreen: View {
  var body: some View {
    ListView(title: "Rainy Day Reserves") {
      ListSectionView(title: "Account Information") {
        DataListItemView(icon: .money, label: "Debt", value: "1 200 kr")
        DataListItemView(icon: .limit, label: "Limit", value: "20 000 kr")
      }
      ListSectionView(title: "Transactions") {
        DataListItemView(
          heading: "31 May 2023",
          label: "Monthly Savings Contribution",
          value: "1 000 kr"
        )
        DataListItemView(
          heading: "12 May 2023",
          label: "Medical Expense Coverage",
          value: "-2 000 kr"
        )
        DataListItemView(
          heading: "9 May 2023",
          label: "Withdrawal for Car Repair",
          value: "-5 000 kr"
        )
        DataListItemView(
          heading: "30 April 2023",
          label: "Monthly Savings Contribution",
          value: "1 000 kr"
        )
      }
    }
  }
}

struct CreditCardAccountScreen_Preview: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      CreditCardAccountScreen()
    }
  }
}
