//
//  UIView+AddSubview.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/7/20.
//  Copyright © 2020 thond. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addFitSubview(_ subView: UIView) {
        self.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = subView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = subView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let widthConstraint = subView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1)
        let heightConstraint = subView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}

extension UIView {
    var globalFrame: CGRect? {
        let rootView = UIApplication.shared.keyWindow?.rootViewController?.view
        return self.superview?.convert(self.frame, to: rootView)
    }
}
