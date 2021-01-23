//
//  TestAddSubviewView.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 1/23/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit
import SnapKit

class FloatTableviewDatasource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var models: [String] = {
        let ran = Int.random(in: 2...10)
        return Array(1...ran).map {"floating:\($0)"}
    }()
    
    func reload() {
        models = Array(1...Int.random(in: 2...10)).map {"floating:\($0)"}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("thond: did select \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


class TestAddSubviewView: BaseView {
    
    var viewDidLoad: (()->())?
    
    var floatTableviewDatasource = FloatTableviewDatasource()

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    let floatTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .lightGray
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 100.0;
        return tableView
    }()
    
    override func commonInit() {
        self.addFitSubview(tableView)
        self.addSubview(floatTableView)
        tableView.delegate = self
        tableView.dataSource = self
        floatTableView.dataSource = floatTableviewDatasource
        floatTableView.delegate = floatTableviewDatasource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        floatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        viewDidLoad = {[weak self] in
            guard let self = self else {return}

        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func showFloatingView() {
        //self.floatTableView.isHidden = !self.floatTableView.isHidden
        self.floatTableView.removeFromSuperview()
        self.addSubview(floatTableView)
        self.floatTableviewDatasource.reload()
        self.floatTableView.reloadData()
        guard let header = self.tableView.headerView(forSection: 0)?.subviews.first(where: {$0 is UIButton})?.snp.bottom else {return}
        let contentSizeHeight = self.floatTableView.contentSize.height
        let showFull = self.floatTableView.frame.origin.y + contentSizeHeight > 729
        self.floatTableView.snp.remakeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            if showFull {
                make.bottom.equalTo(self.snp.bottom) }
            else {
                make.height.equalTo(contentSizeHeight)
            }
            make.top.equalTo(header)
        }
    }
}

extension TestAddSubviewView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "thond: \(indexPath.row)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("thond: did select \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView(frame: .zero)
        let button = UIButton(type: .infoLight)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        let horizontalConstraint = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        view.addConstraints([horizontalConstraint, verticalConstraint])
        view.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(showFloatingView), for: .touchUpInside)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}
