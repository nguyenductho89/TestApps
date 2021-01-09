//
//  TestViewController.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 12/11/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    let second = SecondTestViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TestViewController"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(toSecond))
        // Do any additional setup after loading the view.
    }

    @objc func toSecond() {
        
        second.delegate = self
        self.navigationController?.pushViewController(second, animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class SecondTestViewController: UIViewController{

//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        /// ...
//        trackLifetime()
//    }
    var delegate: UIViewController?
    let c = C()
    let d = D()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SecondTestViewController"
        let a = A()
        let b = B()
        a.b = b
        b.a = a
        
        c.d = d
        d.c = c
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class C {
    var d: D?
}

class D {
    var c: C?
}

class A {
    var b: B?
}

class B {
    var a: A?
}
