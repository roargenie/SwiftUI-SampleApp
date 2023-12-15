//
//  FunFactsView.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/14.
//

import SwiftUI

struct FunFactsView: View {
    
    @State private var funfacts = ""
    
    var body: some View {
        
        VStack {
            
            Text("FunFacts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funfacts)
                .padding()
                .font(.title)
                .frame(maxHeight: 400)
            
            Button("Show Random Fact") {
                funfacts = information.funFacts.randomElement()!
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.cyan)
            .cornerRadius(16)
            
        }
        .padding()
        
    }
    
}

struct FunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        FunFactsView()
    }
}
