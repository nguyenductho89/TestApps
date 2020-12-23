//
//  TableCustomViewModel.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 12/23/20.
//  Copyright © 2020 thond. All rights reserved.
//

import SwiftUI

struct CustomViewModel: Identifiable {
    var id = UUID()
    var time = 0
}

class TableCustomViewModel: ObservableObject {
    @Published var customViewModel = [CustomViewModel]()
    
    init() {
        customViewModel = [CustomViewModel(time: Int.random(in: 0...1000)),
                           CustomViewModel(time: Int.random(in: 0...1000)),
                           CustomViewModel(time: Int.random(in: 0...1000)),
                           CustomViewModel(time: Int.random(in: 0...1000))]

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.customViewModel = [CustomViewModel(time: Int.random(in: 0...1000)),
                                        CustomViewModel(time: Int.random(in: 0...1000)),
                                        CustomViewModel(time: Int.random(in: 0...1000)),
                                        CustomViewModel(time: Int.random(in: 0...1000))]
            }

    }
}
