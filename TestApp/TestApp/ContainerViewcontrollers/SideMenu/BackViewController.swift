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
    
    func addChildViewController(leftViewController: UIViewController,
                       rightViewController: UIViewController) {
        guard let rightView = rightViewController.view,
              let leftView = leftViewController.view else {return}
        backView.rightContainerView.addSubview(rightView)
        rightView.translatesAutoresizingMaskIntoConstraints = false
        [rightView.leadingAnchor.constraint(equalTo: backView.rightContainerView.leadingAnchor),
         rightView.topAnchor.constraint(equalTo: backView.rightContainerView.topAnchor),
         rightView.bottomAnchor.constraint(equalTo: backView.rightContainerView.bottomAnchor),
         rightView.widthAnchor.constraint(equalToConstant: rightView.frame.size.width)]
            .forEach {$0.isActive = true}
        backView.leftContainerView.addFitSubview(leftView)
        
        self.addChild(leftViewController)
        self.addChild(rightViewController)
        rightViewController.didMove(toParent: self)
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
