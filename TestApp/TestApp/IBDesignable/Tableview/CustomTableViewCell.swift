//
//  CustomTableViewCell.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/9/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

@IBDesignable class CustomTableViewCell: UITableViewCell {
    
    var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        contentView.addFitSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomDesignableView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
