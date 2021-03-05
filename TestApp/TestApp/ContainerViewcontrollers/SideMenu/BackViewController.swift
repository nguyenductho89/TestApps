//
//  BackViewController.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit

class BackViewController: UIViewController {
        
    
    private var backView: BackView = {
        let view = BackView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addFitSubview(backView)
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePanGesture(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    func addChildViews(leftView: UIView,
                       rightView: UIView) {
        backView.leftContainerView.addFitSubview(leftView)
        backView.rightContainerView.addFitSubview(rightView)
    }
}

extension BackViewController: UIGestureRecognizerDelegate {
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let movingDistance = recognizer.translation(in: self.view)
        self.backView.updateLeftViewPosition(movingDistance.x)
        
        print("thond: trans \(recognizer.translation(in: self.view))")
        print("thond: velo \(recognizer.velocity(in: self.view))")
    }
}
