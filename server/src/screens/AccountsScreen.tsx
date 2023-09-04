import {
  DataListItem,
  Icon,
  List,
  ListSection,
  ServerContent,
  WidgetListItem,
} from "@sneakycash/library/server"
import { CreditCardAccount } from "../model/CreditCardAccount"
import { SavingsAccount } from "../model/SavingsAccount"
import { TotalDebtWidget } from "../widgets/TotalDebtWidget"
import { TotalSavingsWidget } from "../widgets/TotalSavingsWidget"
import { CreditCardAccountScreen } from "./CreditCardAccountScreen"
import { SavingsAccountScreen } from "./SavingsAccountScreen"

type Props = {
  creditCardAccounts: CreditCardAccount[]
  savingsAccounts: SavingsAccount[]
}

export function AccountsScreen({ creditCardAccounts, savingsAccounts }: Props) {
  return (
    <List
      title="Accounts"
      destinations={[
        ...creditCardAccounts.map((account) => (
          <ServerContent
            clientUrl={`${account.accountNumber}`}
            serverUrl={`http://localhost:8000/accounts/${account.accountNumber}`}
          >
            {CreditCardAccountScreen({ creditCardAccount: account })}
          </ServerContent>
        )),
        ...savingsAccounts.map((account) => (
          <ServerContent
            clientUrl={`${account.accountNumber}`}
            serverUrl={`http://localhost:8000/accounts/${account.accountNumber}`}
          >
            {SavingsAccountScreen({ savingsAccount: account })}
          </ServerContent>
        )),
      ]}
    >
      <WidgetListItem>
        <ServerContent serverUrl="http://localhost:8000/accounts/totaldebt">
          {TotalDebtWidget({ value: "0 000 kr", skeleton: true })}
        </ServerContent>
        <ServerContent serverUrl="http://localhost:8000/accounts/totalsavings">
          {TotalSavingsWidget({ value: "0 000 kr", skeleton: true })}
        </ServerContent>
      </WidgetListItem>
      {creditCardAccounts && (
        <ListSection title="Credit Cards">
          {creditCardAccounts.map((account) => (
            <DataListItem
              icon={Icon.Card}
              label={account.name}
              value={account.debt}
              clientUrl={`/accounts/${account.accountNumber}`}
            />
          ))}
        </ListSection>
      )}
      {savingsAccounts && (
        <ListSection title="Savings Accounts">
          {savingsAccounts.map((account) => (
            <DataListItem
              icon={Icon.Money}
              label={account.name}
              value={account.balance}
              clientUrl={`/accounts/${account.accountNumber}`}
            />
          ))}
        </ListSection>
      )}
    </List>
  )
}
