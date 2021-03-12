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
    
    func setConstraint() {
        leftContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        leftContainerViewWithConstraint = leftContainerView.widthAnchor.constraint(equalToConstant: 200)
        [leftContainerView.topAnchor.constraint(equalTo: self.topAnchor),
         leftContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         leftContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         leftContainerViewWithConstraint].forEach {$0?.isActive = true}
        
        rightContainerView.translatesAutoresizingMaskIntoConstraints = false
        [rightContainerView.topAnchor.constraint(equalTo: self.topAnchor),
        rightContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        rightContainerView.leadingAnchor.constraint(equalTo: self.leftContainerView.trailingAnchor),
        rightContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)]
            .forEach {$0?.isActive = true}
    }
    
    func updateLefView(_ movingDistance: CGFloat) {
        let currentWidth = self.leftContainerView.frame.size.width
        var d = currentWidth + movingDistance < self.frame.size.width*3.0/4.0 ?
            currentWidth + movingDistance : self.frame.size.width*3.0/4.0
        if d < 0 { d = 0 }
        leftContainerViewWithConstraint.isActive = false
        leftContainerViewWithConstraint = leftContainerView.widthAnchor.constraint(equalToConstant: d)
        leftContainerViewWithConstraint.isActive = true
        UIView.animate(withDuration: 0.3) {
            [weak self] in
            guard let self = self else {return}
            self.layoutIfNeeded()
            print("thond: width: \(self.leftContainerView.frame.size.width)")
        }
    }
    
    func updateLeftViewPosition(_ movingDistance: CGFloat) {
        updateLefView(movingDistance)
    }
}
