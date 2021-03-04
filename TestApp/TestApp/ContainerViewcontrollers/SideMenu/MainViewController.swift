//
//  MainViewController.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        self.title = "Main"
        
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        label.textAlignment = .center
        label.text = "Main VC"
        self.view.addFitSubview(label)
    }
}
