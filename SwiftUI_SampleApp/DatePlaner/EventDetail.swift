//
//  EventDetail.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/15.
//

import SwiftUI

struct EventDetail: View {
    @Binding var event: Event
    let isEditing: Bool
    
    @State private var isPickingSymbol = false
    
    var body: some View {
        
        List {
            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: event.symbol)
                        
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 5)

            }
            
            if isEditing {
                DatePicker("Date", selection: $event.date)
                    .labelsHidden()
                    .listRowSeparator(.hidden)
            } else {
                HStack {
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                }
                .listRowSeparator(.hidden)
            }
            
            Text("Tasks")
                .fontWeight(.bold)
            
            ForEach($event.tasks) { $item in
                TaskRow(task: $item, isEditing: isEditing)
            }
            .onDelete(perform: { indexSet in
                event.tasks.remove(atOffsets: indexSet)
            })
            
            Button {
                event.tasks.append(EventTask(text: "", isNew: true))
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Task")
                }
            }
            .buttonStyle(.borderless)
        }
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .sheet(isPresented: $isPickingSymbol) {
            SymbolPicker(event: $event)
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: .constant(Event.example), isEditing: true)
    }
}
