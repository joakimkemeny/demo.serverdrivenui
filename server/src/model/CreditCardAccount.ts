export type CreditCardTransaction = {
  date: string
  description: string
  amount: string
}

export type CreditCardAccount = {
  name: string
  accountNumber: string
  debt: string
  limit: string
  transactions: CreditCardTransaction[]
}

const transactions = [
  { date: "31 May 2023", description: "Monthly Savings Contribution", amount: "1 000 kr" },
  { date: "12 May 2023", description: "Medical Expense Coverage", amount: "-2 000 kr" },
  { date: "9 May 2023", description: "Withdrawal for Car Repair", amount: "-500 kr" },
  { date: "30 April 2023", description: "Monthly Savings Contribution", amount: "1 000 kr" },
]

export const creditCardAccounts: CreditCardAccount[] = [
  {
    name: "Diamond Elite",
    accountNumber: "1234567",
    debt: "34 830 kr",
    limit: "50 000 kr",
    transactions,
  },
  {
    name: "Platinum Prestige",
    accountNumber: "2345678",
    debt: "1 200 kr",
    limit: "10 000 kr",
    transactions,
  },
]
