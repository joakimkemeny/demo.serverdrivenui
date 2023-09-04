import SwiftUI

public struct ButtonView: View {
  private let label: String
  private let icon: String
  private let action: () -> Void

  init(_ label: String, icon: String, action: @escaping () -> Void) {
    self.label = label
    self.icon = icon
    self.action = action
  }

  public var body: some View {
    Button(action: action) {
      Label(label, systemImage: icon)
    }
    .buttonStyle(GrowingButton())
  }
}

struct GrowingButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color(red: 0.79, green: 0.23, blue: 0.46))
      .foregroundStyle(.white)
      .clipShape(Capsule())
      .scaleEffect(configuration.isPressed ? 1.1 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

struct ButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonView("A button", icon: "lock") {
      print("Button clicked")
    }
  }
}
