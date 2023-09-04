import SwiftUI

public struct TextView: View {
  let text: String

  public init(text: String) {
    self.text = text
  }

  public var body: some View {
    Text(text)
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    TextView(text: "Test")
  }
}
