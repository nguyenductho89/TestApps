//
//  SideMenuView.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/4/21.
//  Copyright © 2021 thond. All rights reserved.
//

import UIKit

typealias SelectedCallBack<A> = (A) -> ()

class SideMenuView: BaseView {
    
    var selectedMenu: SelectedCallBack<String>?
    
    var menu: [SideMenuModel] = [
        SideMenuModel(title: "Home"),
        SideMenuModel(title: "Music"),
        SideMenuModel(title: "Movies"),
        SideMenuModel(title: "Books"),
        SideMenuModel(title: "Profile"),
        SideMenuModel(title: "Settings"),
        SideMenuModel(title: "Like us on facebook")
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func commonInit() {
        self.addFitSubview(tableView)
    }
    
}

extension SideMenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMenu?(menu[indexPath.row].title)
    }
}

// MARK: - UITableViewDataSource

extension SideMenuView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = self.menu[indexPath.row].title
        return cell ?? UITableViewCell()
    }
}

