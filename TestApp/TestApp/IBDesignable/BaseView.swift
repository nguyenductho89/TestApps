//
//  BaseView.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/7/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

@IBDesignable class BaseView: UIView {
    override func layoutSubviews() {
        self.commonInit()
    }
    func commonInit() {}
}


