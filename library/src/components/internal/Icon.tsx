import { Icon as IconType } from "../../index-server"
import { ArrowDownIcon } from "./icons/ArrowDownIcon"
import { ArrowUpIcon } from "./icons/ArrowUpIcon"
import { CardIcon } from "./icons/CardIcon"
import { LimitIcon } from "./icons/LimitIcon"
import { LockIcon } from "./icons/LockIcon"
import { MoneyIcon } from "./icons/MoneyIcon"
import { NumberIcon } from "./icons/NumberIcon"
import { PercentIcon } from "./icons/PercentIcon"

type Props = {
  color?: string
  size?: number
  icon: IconType
}

export function Icon({ color, size, icon }: Props) {
  switch (icon) {
    case IconType.ArrowDown:
      return <ArrowDownIcon size={size} color={color} />
    case IconType.ArrowUp:
      return <ArrowUpIcon size={size} color={color} />
    case IconType.Card:
      return <CardIcon size={size} color={color} />
    case IconType.Limit:
      return <LimitIcon size={size} color={color} />
    case IconType.Lock:
      return <LockIcon size={size} color={color} />
    case IconType.Money:
      return <MoneyIcon size={size} color={color} />
    case IconType.Number:
      return <NumberIcon size={size} color={color} />
    case IconType.Percent:
      return <PercentIcon size={size} color={color} />
  }
}
