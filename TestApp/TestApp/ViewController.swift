//
//  ViewController.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/7/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @ObservedObject var viewModel = TableCustomViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }

}

