//
//  StoryView.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/14.
//

import SwiftUI

struct StoryView: View {
    
    var body: some View {
        NavigationStack {
            StoryPageView(story: story, pageIndex: 0)
        }
    }
    
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
