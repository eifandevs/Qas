//
//  PageHistory.swift
//  Qas
//
//  Created by temma on 2017/11/12.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

class PageHistory: NSObject, NSCoding {
    var context: String = NSUUID().uuidString
    var url: String = ""
    var title: String = ""
    
    override init() {
        super.init()
    }
    
    init(context: String = NSUUID().uuidString, url: String = "", title: String = "") {
        self.context = context
        self.url = url
        self.title = title
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let context = decoder.decodeObject(forKey: "context") as! String
        let url = decoder.decodeObject(forKey: "url") as! String
        let title = decoder.decodeObject(forKey: "title") as! String
        self.init(context: context, url: url, title: title)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(context, forKey: "context")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(title, forKey: "title")
    }
}