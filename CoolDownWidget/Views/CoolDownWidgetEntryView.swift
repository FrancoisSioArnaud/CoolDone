//
//  CoolDownWidgetEntryView.swift
//  CoolDownWidget
//
//  Created by François Arnaud on 31/05/2026.
//

import SwiftUI
import WidgetKit

struct CoolDownWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}
