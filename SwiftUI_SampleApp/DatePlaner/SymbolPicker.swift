//
//  SymbolPicker.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/15.
//

import SwiftUI

struct SymbolPicker: View {
    @Binding var event: Event
    @State private var selectedColor: Color = ColorOptions.default
    @Environment(\.dismiss) private var dismiss
    @State private var symbolNames = EventSymbols.symbolNames
    @State private var searchInput = ""
    
    var columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }
            
            HStack {
                Image(systemName: event.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)
            }
            .padding()
            
            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
                        event.color = color
                    } label: {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button {
                            event.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .sfSymbolStyling()
                                .foregroundColor(selectedColor)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
            selectedColor = event.color
        }
    }
}

struct SymbolPicker_Previews: PreviewProvider {
    static var previews: some View {
        SymbolPicker(event: .constant(Event.example))
    }
}
