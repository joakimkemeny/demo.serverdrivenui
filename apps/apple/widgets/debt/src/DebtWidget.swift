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

struct DebtWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    WidgetView(icon: .arrowDown, label: "Total Debt", value: "34 950 kr")
  }
}

struct DebtWidget: Widget {
  let kind: String = "DebtWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      if #available(iOS 17.0, *) {
        DebtWidgetEntryView(entry: entry)
          .containerBackground(.fill.tertiary, for: .widget)
      } else {
        DebtWidgetEntryView(entry: entry)
          .padding()
          .background()
      }
    }
    .configurationDisplayName("Credit Card Debt")
    .description("This widget show the debt of your credit cards")
  }
}

#Preview(as: .systemSmall) {
  DebtWidget()
} timeline: {
  SimpleEntry(date: .now)
}
