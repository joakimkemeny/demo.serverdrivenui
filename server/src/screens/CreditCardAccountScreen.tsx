import { DataListItem, Icon, List, ListSection } from "@sneakycash/library/server"
import { CreditCardAccount } from "../model/CreditCardAccount"

type Props = {
  creditCardAccount: CreditCardAccount
}

export function CreditCardAccountScreen({ creditCardAccount }: Props) {
  return (
    <List title={creditCardAccount.name}>
      <ListSection title="Account Information">
        <DataListItem icon={Icon.Money} label="Debt" value={creditCardAccount?.debt ?? ""} />
        <DataListItem icon={Icon.Limit} label="Limit" value={creditCardAccount?.limit ?? ""} />
      </ListSection>
      <ListSection title="Transactions">
        {creditCardAccount?.transactions.map((transaction) => (
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
