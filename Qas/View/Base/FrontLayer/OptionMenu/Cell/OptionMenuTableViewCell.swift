//
//  OptionMenuTableViewCell.swift
//  Qas
//
//  Created by temma on 2017/12/17.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import UIKit

class OptionMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// ビューモデル情報設定
    func setViewModelData(row: OptionMenuTableViewModel.Row) {
        thumbnailButton.setImage(image: UIImage(named: row.imageName), color: UIColor.black)
        thumbnailButton.imageEdgeInsets = UIEdgeInsetsMake(9, 9, 9, 9)
        thumbnailButton.isUserInteractionEnabled = false
        titleLabel.text = row.title
    }
    
}