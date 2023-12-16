//
//  EventTask.swift
//  SwiftUI_SampleApp
//
//  Created by 이명진 on 2023/12/15.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
