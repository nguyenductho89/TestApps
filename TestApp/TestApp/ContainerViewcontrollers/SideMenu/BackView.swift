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
        view.backgroundColor = .systemRed
        return view
    }()
    
    override func commonInit() {
        self.backgroundColor = .lightGray
        self.addSubview(leftContainerView)
        self.addSubview(rightContainerView)
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
}
