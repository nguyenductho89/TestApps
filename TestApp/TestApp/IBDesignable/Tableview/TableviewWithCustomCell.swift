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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension TableviewWithCustomCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
//        if cell == nil {
//            cell = CustomTableViewCell()
//        }
        let cell = CustomTableViewCell()
        
        cell.textLabel?.text = "manhdm: \(indexPath.row)"
        //cell.textLabel?.text = "thond"
//        cell.backgroundColor = .green
//        cell.textLabel?.text = "thond"
        //return CustomTableViewCell()
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
            return 1
            default:return 2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("thond: did select \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
