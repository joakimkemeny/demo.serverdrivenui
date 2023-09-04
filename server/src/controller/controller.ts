import { creditCardAccounts } from "../model/CreditCardAccount"
import { savingsAccounts } from "../model/SavingsAccount"
import { AccountsScreen } from "../screens/AccountsScreen"
import { CreditCardAccountScreen } from "../screens/CreditCardAccountScreen"
import { LoginScreen } from "../screens/LoginScreen"
import { SavingsAccountScreen } from "../screens/SavingsAccountScreen"
import { TotalDebtWidget } from "../widgets/TotalDebtWidget"
import { TotalSavingsWidget } from "../widgets/TotalSavingsWidget"

const showAccountsDelay = 0
const showAccountDelay = 0
const showLoginDelay = 0
const showTotalDebtDelay = 0
const showTotalSavingsDelay = 0

export async function showAccounts() {
  console.log("Showing accounts")
  await delay(showAccountsDelay)

  return AccountsScreen({ creditCardAccounts, savingsAccounts })
}

export async function showAccount(accountNumber: string) {
  console.log("Showing account", accountNumber)
  await delay(showAccountDelay)

  const creditCardAccount = creditCardAccounts.find((a) => a.accountNumber == accountNumber)
  const savingsAccount = savingsAccounts.find((a) => a.accountNumber == accountNumber)

  if (creditCardAccount !== undefined) {
    return CreditCardAccountScreen({ creditCardAccount })
  } else if (savingsAccount !== undefined) {
    return SavingsAccountScreen({ savingsAccount })
  } else {
    throw Error()
  }
}

export async function showLogin() {
  console.log("Showing login")
  await delay(showLoginDelay)

  return LoginScreen({})
}

export async function showTotalDebt() {
  console.log("Showing total debt")
  await delay(showTotalDebtDelay)

  return TotalDebtWidget({ value: "34 950 kr", skeleton: false })
}

export async function showTotalSavings() {
  console.log("Showing total savings")
  await delay(showTotalSavingsDelay)

  return TotalSavingsWidget({ value: "110 240 kr", skeleton: false })
}

// Helpers

function delay(delay: number) {
  return new Promise(function (resolve) {
    setTimeout(resolve, delay)
  })
}
