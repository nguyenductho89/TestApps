//
//  HomeViewController.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = .systemOrange
        self.navigationItem.leftBarButtonItem = sideMenuBtn
    }
}
