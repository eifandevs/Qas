//
//  FormMenuViewModel.swift
//  Qas
//
//  Created by User on 2017/06/21.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation

class FormMenuViewModel: OptionMenuTableViewModel {
    override init() {
        super.init()
    }
    
    override func setup() {
        let items = FormDataModel.s.select().map { (form) -> OptionMenuItem in
            return OptionMenuItem(_id: form.id, type: .deletablePlain, title: form.title, url: form.url, date: form.date)
        }
        
        menuItems.append(items)
        commonAction = { (menuItem: OptionMenuItem) -> OptionMenuTableViewModel? in
            let encodedText = menuItem.url!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
            OperationDataModel.s.executeOperation(operation: .search, object: encodedText!)
            return nil
        }
    }
}
