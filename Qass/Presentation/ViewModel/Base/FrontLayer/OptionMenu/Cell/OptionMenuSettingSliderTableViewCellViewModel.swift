//
//  OptionMenuSettingSliderTableViewCellViewModel.swift
//  Qass
//
//  Created by tenma on 2018/11/08.
//  Copyright © 2018年 eifandevs. All rights reserved.
//

import Foundation
import Model

final class OptionMenuSettingSliderTableViewCellViewModel {
    /// スクロール速度設定変更
    func changeValue(value: Float) {
        ScrollUseCase.s.autoScrollInterval = CGFloat(-value)
    }
}