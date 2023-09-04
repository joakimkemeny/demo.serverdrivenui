import SwiftUI

public struct LoginScreen: View {
  public init() {}

  public var body: some View {
    LoginView(
      title: "Sneaky Cash",
      intro: "Welcome to Sneaky Cash, where trust is a commodity as rare as a hidden treasure. Enter at your own discretion.",
      actionLabel: "Enter",
      actionIcon: .lock,
      actionClientUrl: "/savingsaccounts",
      actionServerUrl: "/savingsaccounts"
    )
  }
}

struct LoginScreen_Previews: PreviewProvider {
  static var previews: some View {
    LoginScreen()
  }
}
