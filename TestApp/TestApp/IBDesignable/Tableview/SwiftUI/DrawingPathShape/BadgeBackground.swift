//
//  BadgeBackground.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 1/12/21.
//  Copyright © 2021 thond. All rights reserved.
//

import SwiftUI

struct StateView {
    var showDetail = false
}

struct BadgeBackground: View {
    @State var stateView: StateView
    var body: some View {
        Button(action: {
            withAnimation {
                self.stateView.showDetail.toggle()
            }
        })
        {
            Image(systemName: "chevron.right.circle")
                .imageScale(.large)
                //.rotationEffect(.degrees(self.stateView.showDetail ? 90 : 0))
                .scaleEffect(self.stateView.showDetail ? 1.5 : 1)
                
        }
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground(stateView: StateView())
    }
}
