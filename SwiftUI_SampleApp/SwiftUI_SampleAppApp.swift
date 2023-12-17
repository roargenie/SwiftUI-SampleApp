//
//  SwiftUI_SampleAppApp.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/14.
//

import SwiftUI

@main
struct SwiftUI_SampleAppApp: App {
    
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventList()
                
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
        }
        
    }
}
