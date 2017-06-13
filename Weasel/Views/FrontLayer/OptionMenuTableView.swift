//
//  OptionMenuTableView.swift
//  Weasel
//
//  Created by User on 2017/06/12.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

class OptionMenuTableView: UIView, UITableViewDelegate, UITableViewDataSource, ShadowView {
    
    private var tableView: UITableView? = nil
    private var viewModel: OptionMenuTableViewModel!
    private var clickedLocation: CGPoint! = nil
    private var swipeDirection: EdgeSwipeDirection! = .none
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        addMenuShadow()
        
        backgroundColor = UIColor.clear
        layer.cornerRadius = 2.5
        
        let tableView = UITableView(frame: CGRect(origin: CGPoint.zero, size: frame.size))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.isUserInteractionEnabled = true
        tableView.separatorColor = UIColor.dandilionSeeds
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.showsHorizontalScrollIndicator = true
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        tableView.allowsSelection = true
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 2.5
        addSubview(tableView)
    }
    
    convenience init(frame: CGRect, viewModel: OptionMenuTableViewModel, direction: EdgeSwipeDirection) {
        self.init(frame: frame)
        self.swipeDirection = direction
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = viewModel.menuItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        log.warning("did select")
//            let cell = tableView.cellForRow(at: indexPath)
//            let margin = swipeDirection == .left ? 20 : -20
//            detailView = OptionMenuTableView(frame: CGRect(x: margin.cgfloat, y: 0, width: AppDataManager.shared.optionMenuSize.width, height: AppDataManager.shared.optionMenuSize.height), viewModel: SettingMenuViewModel(), direction: swipeDirection)
//            addSubview(detailView!)
    }
}
