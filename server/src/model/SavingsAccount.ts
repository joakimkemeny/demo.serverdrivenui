export type SavingsAccountTransaction = {
  date: string
  description: string
  amount: string
}

export type SavingsAccount = {
  name: string
  accountNumber: string
  interestRate: string
  balance: string
  transactions: SavingsAccountTransaction[]
}

const transactions = [
  { date: "31 May 2023", description: "Monthly Savings Contribution", amount: "1 000 kr" },
  { date: "12 May 2023", description: "Medical Expense Coverage", amount: "-2 000 kr" },
  { date: "9 May 2023", description: "Withdrawal for Car Repair", amount: "-500 kr" },
  { date: "30 April 2023", description: "Monthly Savings Contribution", amount: "1 000 kr" },
]

export const savingsAccounts: SavingsAccount[] = [
  {
    name: "Rainy Day Reserves",
    accountNumber: "3456789",
    interestRate: "3,40 %",
    balance: "1 340 kr",
    transactions,
  },
  {
    name: "Adventure Awaits",
    accountNumber: "4567890",
    interestRate: "2,85 %",
    balance: "92 600 kr",
    transactions,
  },
  {
    name: "Future Home Haven",
    accountNumber: "5678901",
    interestRate: "3,05 %",
    balance: "16 300 kr",
    transactions,
  },
]
