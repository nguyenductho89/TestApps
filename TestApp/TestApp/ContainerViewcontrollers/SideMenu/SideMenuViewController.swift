//
//  SideMenuViewController.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit
struct SideMenuModel {
    var title: String
}

class SideMenuViewController: UIViewController {
    
    lazy var sideMenuView: SideMenuView = {
        let view = SideMenuView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SideMenuViewController"
        self.view.backgroundColor = .systemRed
        self.view.addFitSubview(sideMenuView)
        self.sideMenuView.selectedMenu = {[weak self] menu in
            print("thond: menu \(menu)")
        }
    }
}
