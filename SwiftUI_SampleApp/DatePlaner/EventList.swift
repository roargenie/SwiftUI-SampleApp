//
//  EventList.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/15.
//

import SwiftUI

struct EventList: View {
    
    @EnvironmentObject var eventData: EventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = Event()
    
    var body: some View {
        
        List {
            ForEach(Period.allCases) { period in
                if !eventData.sortedEvents(period: period).isEmpty {
                    Section(content: {
                        ForEach(eventData.sortedEvents(period: period)) { $event in
                            NavigationLink {
                                
                            } label: {
                                
                            }

                        }
                    })
                }
            }
            
        }
        
    }
    
    
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
