//
//  Double+Extend.swift
//  Weasel
//
//  Created by User on 2017/06/12.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

public extension Double {
    public var cgfloat: CGFloat {
        get {
            return CGFloat(self)
        }
    }
}
