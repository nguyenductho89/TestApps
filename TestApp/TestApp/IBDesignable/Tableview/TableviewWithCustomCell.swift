//
//  TableviewWithCustomCell.swift
//  TestApp
//
//  Created by Nguyễn Đức Thọ on 12/9/20.
//  Copyright © 2020 thond. All rights reserved.
//

import UIKit

class TableviewWithCustomCell: BaseView {
    override func commonInit() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        self.addFitSubview(tableView)
        //tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension TableviewWithCustomCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = "thond: \(indexPath.row)"
        let cell = CustomTableViewCell()
        //cell.textLabel?.text = "thond"
        cell.backgroundColor = .green
        //cell.textLabel?.text = "thond"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("thond: did select \(indexPath.row)")
    }
}
