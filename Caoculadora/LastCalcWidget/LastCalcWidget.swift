//
//  LastCalcWidget.swift
//  LastCalcWidget
//
//  Created by Francisco Miranda Soares on 19/05/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {

    let defaults = UserDefaults(suiteName: "group.br.ufpe.cin.fmssn.Caoculadora")

    // placeholder, tapa buraco
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), result: 28)
    }

    // estado atual do widget
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let lastResult = defaults?.integer(forKey: "result")
        if let lastResult = lastResult, lastResult != 0 {
            let entry = SimpleEntry(date: Date(), result: lastResult)
            completion(entry)
        }
    }

    // timeline, entradas *no futuro*
    // mas no nosso caso, não temos como prever
    // cálculos do futuro
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []
        let lastResult = defaults?.integer(forKey: "result")
        if let lastResult = lastResult, lastResult != 0 {
            let entry = SimpleEntry(date: Date(), result: lastResult)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let result: Int
}

struct LastCalcWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text("Último cálculo:")
                .font(.header5)
            Text("\(entry.result) anos!")
        }
    }
}

struct LastCalcWidget: Widget {
    let kind: String = "LastCalcWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                LastCalcWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                LastCalcWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    LastCalcWidget()
} timeline: {
    SimpleEntry(date: .now, result: 28)
    SimpleEntry(date: .now, result: 21)
}
