import { Icon, Widget } from "@sneakycash/library/server"

type Props = {
  value: string
  skeleton: boolean
}

export function TotalSavingsWidget({ value, skeleton }: Props) {
  return <Widget icon={Icon.ArrowUp} label="Total Savings" value={value} skeleton={skeleton} />
}
