//
//  ViewController.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/7/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(toNil))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(toFirst))
        // Do any additional setup after loading the view.
    }

    @objc func toFirst() {
        let first = TestViewController()
        self.navigationController?.pushViewController(first, animated: false)
    }
    
    @objc func toNil() {

        //self.first.releaseMe()
            
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }

}

extension NSObjectProtocol {
  /// Same as retain(), which the compiler no longer lets us call:
  @discardableResult
  func retainMe() -> Self {
    _ = Unmanaged.passRetained(self)
    return self
  }

  /// Same as autorelease(), which the compiler no longer lets us call.
  ///
  /// This function does an autorelease() rather than release() to give you more flexibility.
  @discardableResult
  func releaseMe() -> Self {
    _ = Unmanaged.passUnretained(self).autorelease()
    return self
  }
}
