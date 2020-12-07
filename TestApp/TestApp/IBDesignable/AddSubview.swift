//
//  AddSubview.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/7/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

class AddSubview: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    enum AddSubview: String {
        case useNSLayoutConstraint
        case useAutoresizingMask
        case useNSLayoutAnchor
        case useIntrinsicContentSize //+
    }
    private let addSubViewMethod: AddSubview = .useNSLayoutConstraint

    override func layoutSubviews() {
        self.backgroundColor = .systemTeal
    }
    override func commonInit() {
        super.commonInit()
        let label = UILabel(frame: .zero)
       // let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        label.text = self.addSubViewMethod.rawValue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.cornerRadius = 10.0
        label.layer.borderWidth = 2.0
        self.addSubview(label)
        switch self.addSubViewMethod {
        case .useNSLayoutConstraint:
             let horizontalConstraint = NSLayoutConstraint(item: label,
                                                           attribute: .centerX,
                                                           relatedBy: .equal,
                                                           toItem: self,
                                                           attribute: .centerX,
                                                           multiplier: 1,
                                                           constant: 0)
                let verticalConstraint = NSLayoutConstraint(item: label,
                                                            attribute: .centerY,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .centerY,
                                                            multiplier: 1,
                                                            constant: 0)
                let widthConstraint = NSLayoutConstraint(item: label,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1,
                                                         constant: 100)
                let heightConstraint = NSLayoutConstraint(item: label,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .notAnAttribute,
                                                          multiplier: 1,
                                                          constant: 100)
                self.addConstraints([horizontalConstraint,
                                     verticalConstraint,
                                     widthConstraint,
                                     heightConstraint])
        case .useAutoresizingMask:
            /******/
            label.translatesAutoresizingMaskIntoConstraints = true
            label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        case .useNSLayoutAnchor:
            let horizontalConstraint = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            let verticalConstraint = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            let widthConstraint = label.widthAnchor.constraint(equalToConstant: 200)
            let heightConstraint = label.heightAnchor.constraint(equalToConstant: 200)
            self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        case .useIntrinsicContentSize:
            let customLabel = CustomLabel(frame: .zero)
            customLabel.text = "useIntrinsicContentSize"
            customLabel.translatesAutoresizingMaskIntoConstraints = false
            customLabel.backgroundColor = .white
            self.addSubview(customLabel)
            let horizontalConstraint = customLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
                let verticalConstraint = customLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
            }
    }
}

class CustomLabel: UILabel {
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 300)
    }
}
