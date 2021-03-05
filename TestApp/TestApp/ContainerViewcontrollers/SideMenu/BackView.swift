//
//  BackView.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit
import SnapKit

class BackView: BaseView {
    
    var leftContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .brown
        return view
    }()
    
    var rightContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        return view
    }()
    
    var leftContainerViewWithConstraint: NSLayoutConstraint!
    
    override func commonInit() {
        self.backgroundColor = .lightGray
        self.addSubview(leftContainerView)
        self.addSubview(rightContainerView)
        self.setConstraint()
    }
    
    func setConstraintSnp() {
        leftContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.width.equalTo(200.0)
        }
        
        rightContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(leftContainerView.snp.trailing)
        }
    }
    
    func setConstraint() {
        let horizontalConstraint = leftContainerView.topAnchor.constraint(equalTo: self.topAnchor)
        let verticalConstraint = leftContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let widthConstraint = leftContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        leftContainerViewWithConstraint = leftContainerView.widthAnchor.constraint(equalToConstant: 200)
        self.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, leftContainerViewWithConstraint])
        
        let horizontalConstraint1 = rightContainerView.topAnchor.constraint(equalTo: self.topAnchor)
        let verticalConstraint1 = rightContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let widthConstraint1 = rightContainerView.leadingAnchor.constraint(equalTo: self.leftContainerView.trailingAnchor)
        let heightConstraint1 = rightContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        self.addConstraints([horizontalConstraint1, verticalConstraint1, widthConstraint1, heightConstraint1])
    }
    
    func updateLefViewSnp(_ movingDistance: CGFloat) {
        UIView.animate(withDuration: 0.1) {
            [weak self] in
            guard let self = self else {return}
            let currentWidth = self.leftContainerView.frame.size.width
            self.leftContainerView.snp.updateConstraints { make in
                make.width.equalTo(currentWidth + movingDistance)
            }
            print("thond: snp width: \(self.leftContainerView.frame.size.width)")
        }
    }
    
    func updateLefView(_ movingDistance: CGFloat) {
        UIView.animate(withDuration: 0.1) {
            [weak self] in
            guard let self = self else {return}
            let currentWidth = self.leftContainerView.frame.size.width
            self.leftContainerViewWithConstraint.constant = currentWidth + movingDistance
            self.layoutIfNeeded()
            print("thond: width: \(self.leftContainerView.frame.size.width)")
        }
    }
    
    func updateLeftViewPosition(_ movingDistance: CGFloat) {
        updateLefView(movingDistance)
    }
}
