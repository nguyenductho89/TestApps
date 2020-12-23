//
//  TableviewWithCustomCellSwiftUI.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 12/23/20.
//  Copyright © 2020 thond. All rights reserved.
//

import SwiftUI
struct TableviewWithCustomCellSwiftUI: View {
    @ObservedObject var viewModel = TableCustomViewModel()
    
    var body: some View {
        List(viewModel.customViewModel) { item in
            VStack {
                Text("\(item.time)")
            }.frame(maxWidth: .infinity)
            .onTapGesture {
                print("\(item)")
            }
        }
    }
}

struct TableviewWithCustomCellSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TableviewWithCustomCellSwiftUI()
    }
}
