//
//  BackViewController.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {

    lazy var backView: BackView = {
        let view = BackView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addFitSubview(backView)
        // Do any additional setup after loading the view.
    }
}
