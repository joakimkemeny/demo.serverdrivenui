public enum Icon: String, Codable {
  case arrowDown = "ARROW_DOWN"
  case arrowUp = "ARROW_UP"
  case card = "CARD"
  case limit = "LIMIT"
  case lock = "LOCK"
  case money = "MONEY"
  case number = "NUMBER"
  case percent = "PERCENT"

  var systemImage: String {
    switch self {
      case .arrowDown: "arrow.down.right.circle"
      case .arrowUp: "arrow.up.right.circle"
      case .card: "creditcard"
      case .limit: "calendar.day.timeline.left"
      case .lock: "lock"
      case .money: "percent"
      case .number: "number"
      case .percent: "percent"
    }
  }
}
