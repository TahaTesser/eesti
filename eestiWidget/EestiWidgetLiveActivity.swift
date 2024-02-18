//
//  eestiWidgetLiveActivity.swift
//  eestiWidget
//
//  Created by Taha Tesser on 18.02.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EestiWidgetLiveActivity: Widget {
  var body: some WidgetConfiguration {
      ActivityConfiguration(for: EestiAttributes.self) { context in
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                  Text("🇪🇪")
                }
                DynamicIslandExpandedRegion(.trailing) {
                  Text("🇬🇧")
    
                }
                DynamicIslandExpandedRegion(.bottom) {
                  VStack() {
                    Text(context.state.word)
                    Text(context.state.translation)
                  }
                }
            } compactLeading: {
              Text("🇪🇪")
            } compactTrailing: {
              Text("🇬🇧")
            } minimal: {
              HStack() {
                Text("\(context.state.word):\(context.state.translation)")

              }
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
