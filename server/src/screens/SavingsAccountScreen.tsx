import { DataListItem, Icon, List, ListSection } from "@sneakycash/library/server"
import { SavingsAccount } from "../model/SavingsAccount"

type Props = {
  savingsAccount: SavingsAccount
}

export function SavingsAccountScreen({ savingsAccount }: Props) {
  return (
    <List title={savingsAccount.name}>
      <ListSection title="Account Information">
        <DataListItem icon={Icon.Money} label="Balance" value={savingsAccount.balance} />
        <DataListItem
          icon={Icon.Percent}
          label="Interest rate"
          value={savingsAccount.interestRate}
        />
        <DataListItem
          icon={Icon.Number}
          label="Account number"
          value={savingsAccount.accountNumber}
        />
      </ListSection>
      <ListSection title="Transactions">
        {savingsAccount.transactions.map((transaction) => (
          <DataListItem
            heading={transaction.date}
            label={transaction.description}
            value={transaction.amount}
          />
        ))}
      </ListSection>
    </List>
  )
}
