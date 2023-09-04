import { Icon, Widget } from "@sneakycash/library/server"

type Props = {
  value: string
  skeleton: boolean
}

export function TotalDebtWidget({ value, skeleton }: Props) {
  return <Widget icon={Icon.ArrowDown} label="Total Debt" value={value} skeleton={skeleton} />
}
