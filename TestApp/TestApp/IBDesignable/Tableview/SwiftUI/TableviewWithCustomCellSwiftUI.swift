//
//  TableviewWithCustomCellSwiftUI.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 12/23/20.
//  Copyright © 2020 thond. All rights reserved.
//

import SwiftUI
@available(iOS 14.0, *)
struct TableviewWithCustomCellSwiftUI: View {
    @StateObject var viewModel = TableCustomViewModel()
    
    var body: some View {
        List(viewModel.model) { item in
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
        if #available(iOS 14.0, *) {
            TableviewWithCustomCellSwiftUI()
        } else {
            // Fallback on earlier versions
        }
    }
}
