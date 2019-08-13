//
//  MoreTableViewController.swift
//  MVVMTableView
//
//  Created by BRI on 12/08/19.
//  Copyright © 2019 BRI. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {

    fileprivate var viewModel: MoreDataTableViewModel!
    fileprivate var dataTableMoreTabBar: [MoreHeaderInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = MoreDataTableViewModel()
        dataTableMoreTabBar = viewModel.generateViewModel()
        tableView.tableFooterView = UIView()
//        self.tableView.backgroundColor = UIColor(hex6: 0xF4F4F4)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataTableMoreTabBar.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataTableMoreTabBar[section].info.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreHeaderCell") as? MoreHeaderCell else { return nil}
        let obj = dataTableMoreTabBar[section]
        guard let name = obj.name else { return nil }
        
        cell.label.text = name
        cell.backgroundColor = UIColor.groupTableViewBackground
        return cell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = dataTableMoreTabBar[indexPath.section].info[indexPath.row]
        var tempCell: UITableViewCell?
        
        if let _ = obj.subtitle{
            tempCell = tableView.dequeueReusableCell(withIdentifier: "MoreSubtitleCell", for: indexPath) as? MoreSubtitleCell
        }else{
            tempCell = tableView.dequeueReusableCell(withIdentifier: "MoreBasicCell", for: indexPath) as? MoreBasicCell
        }
        
        guard let cell = tempCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = obj.name
        cell.detailTextLabel?.text = obj.subtitle
        
        if obj.disclosure == true{
            cell.accessoryType = .disclosureIndicator
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 60 ? 1.0 : 60
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj = dataTableMoreTabBar[indexPath.section].info[indexPath.row]
        
        if obj.subtitle != nil{
            return 80
        }else{
            return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = dataTableMoreTabBar[indexPath.section].info[indexPath.row]
        
        if let action = info.action{
            viewModel.perform(action, with: self)
        }
    }

}
