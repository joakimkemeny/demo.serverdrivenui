import { Icon, Login } from "@sneakycash/library/server"

type Props = {}

export function LoginScreen({}: Props) {
  return (
    <Login
      title="Sneaky Cash"
      intro="Welcome to Sneaky Cash, where trust is a commodity as rare as a hidden treasure. Enter at your own discretion."
      actionLabel="Enter"
      actionIcon={Icon.Lock}
      actionClientUrl="/accounts"
      actionServerUrl="https://localhost:8000/accounts"
    />
  )
}
