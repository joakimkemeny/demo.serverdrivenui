import SwiftUI
import UI
import WidgetKit

struct Provider: TimelineProvider {
  func placeholder(in _: Context) -> SimpleEntry {
    SimpleEntry(date: .now)
  }

  func getSnapshot(in _: Context, completion: @escaping (SimpleEntry) -> Void) {
    let entry = SimpleEntry(date: .now)
    completion(entry)
  }

  func getTimeline(in _: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    let entries: [SimpleEntry] = [
      SimpleEntry(date: .now)
    ]

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  var date: Date
}

struct SavingsWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    WidgetView(icon: .arrowUp, label: "Total Savings", value: "110 240 kr")
  }
}

struct SavingsWidget: Widget {
  let kind: String = "SavingsWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      if #available(iOS 17.0, *) {
        SavingsWidgetEntryView(entry: entry)
          .containerBackground(.fill.tertiary, for: .widget)
      } else {
        SavingsWidgetEntryView(entry: entry)
          .padding()
          .background()
      }
    }
    .configurationDisplayName("Savings Account Balance")
    .description("This widget show the balance of your savings accounts")
  }
}

#Preview(as: .systemSmall) {
  SavingsWidget()
} timeline: {
  SimpleEntry(date: .now)
}
