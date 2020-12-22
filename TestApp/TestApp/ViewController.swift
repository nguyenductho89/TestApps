//
//  ViewController.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/7/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

class BaseViewController<DesigableView: BaseView>: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let designableView = DesigableView()
        designableView.frame = self.view.bounds
        self.view.addSubview(designableView)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "thond", style: .done, target: self, action: nil)
        //self.view.subviews.forEach {$0.backgroundColor = .blue}

    }


    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }

}

