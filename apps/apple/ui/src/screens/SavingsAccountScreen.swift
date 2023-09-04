import SwiftUI

struct SavingsAccountScreen: View {
  var body: some View {
    ListView(title: "Rainy Day Reserves") {
      ListSectionView(title: "Account Information") {
        DataListItemView(icon: .money, label: "Balance", value: "1 200 kr")
        DataListItemView(icon: .percent, label: "Interest rate", value: "3,40 %")
        DataListItemView(icon: .number, label: "Account number", value: "1234567")
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

#Preview {
  NavigationStack {
    SavingsAccountScreen()
  }
}
