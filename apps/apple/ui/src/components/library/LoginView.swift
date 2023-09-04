import SwiftUI

public struct LoginView: View {
  let title: String
  let intro: String
  let actionLabel: String
  let actionIcon: Icon
  let actionClientUrl: String
  let actionServerUrl: String

  @Environment(\.currentRoute) var currentRoute

  public init(
    title: String,
    intro: String,
    actionLabel: String,
    actionIcon: Icon,
    actionClientUrl: String,
    actionServerUrl: String
  ) {
    self.title = title
    self.intro = intro
    self.actionLabel = actionLabel
    self.actionIcon = actionIcon
    self.actionClientUrl = actionClientUrl
    self.actionServerUrl = actionServerUrl
  }

  public var body: some View {
    ZStack {
      Color(red: 0.91, green: 0.85, blue: 0.88)
        .ignoresSafeArea()
      VStack(alignment: .leading) {
        Text(title)
          .font(.largeTitle)
          .padding(.bottom)
        Text(intro)
          .font(.body)
          .lineSpacing(5.0)
          .padding(.bottom, 50)
        ButtonView(actionLabel, icon: actionIcon.systemImage) {
          currentRoute.wrappedValue = actionClientUrl
        }
      }
      .padding(.top, 32)
      .padding(.leading, 48)
      .padding(.trailing, 32)
      .padding(.bottom, 48)
      .background(Color.white)
      .clipShape(
        .rect(
          topLeadingRadius: 0,
          bottomLeadingRadius: 30,
          bottomTrailingRadius: 0,
          topTrailingRadius: 0
        )
      )
      .padding(.top, 16)
      .padding(.leading, 16)
      .padding(.trailing, 0)
      .padding(.bottom, 16)
      .frame(maxWidth: UIScreen.main.bounds.size.width)

      UnevenRoundedRectangle(bottomLeadingRadius: 30)
        .stroke(Color(red: 0.79, green: 0.23, blue: 0.46), lineWidth: 3)
        .frame(height: 320)
        .padding(.leading, 40)
        .padding(.bottom, 40)
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
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
