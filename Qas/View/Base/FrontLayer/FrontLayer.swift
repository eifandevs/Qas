//
//  FrontLayer.swift
//  Eiger
//
//  Created by User on 2017/06/06.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

protocol FrontLayerDelegate: class {
    func frontLayerDidInvalidate()
}

class FrontLayer: UIView {
    weak var delegate: FrontLayerDelegate?
    private let viewModel = FrontLayerViewModel()
    private var swipeDirection: EdgeSwipeDirection!
    private var optionMenu: OptionMenuTableView?
    private var overlay: UIButton!
    private var circleMenu: CircleMenu!
    /// ["20170625": ["123456", "234567"], "20170626": ["123456", "234567"]]の形式
    private var deleteHistoryIds: [String: [String]] = [:]
    private var deleteFavoriteIds: [String] = []
    private var deleteFormIds: [String] = []

    let kCircleButtonRadius = 43;
    
    convenience init(frame: CGRect, swipeDirection: EdgeSwipeDirection) {
        self.init(frame: frame)
        // スワイプ方向の保持
        self.swipeDirection = swipeDirection

        // サークルメニューの作成
        let menuItems = [
            [
                CircleMenuItem(image: R.image.circlemenu_menu(), tapAction: { [weak self] (initialPt: CGPoint) in
                    guard let `self` = self else { return }
                    
                    // オプションメニューの表示位置を計算
                    let ptX = self.swipeDirection == .left ? initialPt.x / 6 : DeviceConst.DISPLAY_SIZE.width - 250  - (DeviceConst.DISPLAY_SIZE.width - initialPt.x) / 6
                    let ptY: CGFloat = { () -> CGFloat in
                        let y = initialPt.y - AppConst.FRONT_LAYER_OPTION_MENU_SIZE.height / 2
                        if y < 0 {
                            return 0
                        }
                        if y + AppConst.FRONT_LAYER_OPTION_MENU_SIZE.height > DeviceConst.DISPLAY_SIZE.height {
                            return DeviceConst.DISPLAY_SIZE.height - AppConst.FRONT_LAYER_OPTION_MENU_SIZE.height
                        }
                        return y
                    }()
                    // オプションメニューを表示
                    self.optionMenu = OptionMenuTableView(frame: CGRect(x: ptX, y: ptY, width: AppConst.FRONT_LAYER_OPTION_MENU_SIZE.width, height: AppConst.FRONT_LAYER_OPTION_MENU_SIZE.height), swipeDirection: swipeDirection)
                    self.optionMenu?.delegate = self
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.addSubview(self.optionMenu!)
                    }
                }),
                CircleMenuItem(image: R.image.circlemenu_close(), tapAction: { _ in
                    log.debug("circle menu event. event: close")
                    self.viewModel.removePageHistoryDataModel()
                }),
                CircleMenuItem(image: R.image.circlemenu_historyback(), tapAction: { _ in
                    log.debug("circle menu event. event: history back")
                    self.viewModel.goBackCommonHistoryDataModel()
                }),
                CircleMenuItem(image: R.image.circlemenu_copy(), tapAction: { _ in
                    log.debug("circle menu event. event: copy")
                    PageHistoryDataModel.s.copy()
                }),
                CircleMenuItem(image: R.image.circlemenu_search(), tapAction: { _ in
                    log.debug("circle menu event. event: search")
                    self.viewModel.beginEditingHeaderViewDataModel()
                }),
                CircleMenuItem(image: R.image.circlemenu_add(), tapAction: { _ in
                    log.debug("circle menu event. event: add")
                    self.viewModel.insertPageHistoryDataModel()
                })
            ],
            [
                CircleMenuItem(image: R.image.circlemenu_url(), tapAction: { _ in
                    log.debug("circle menu event. event: url copy")
                    self.viewModel.executeOperationDataModel(operation: .urlCopy)
                }),
                CircleMenuItem(image: R.image.circlemenu_autoscroll(), tapAction: { _ in
                    log.debug("circle menu event. event: auto scroll")
                    self.viewModel.executeOperationDataModel(operation: .autoScroll)
                }),
                CircleMenuItem(image: R.image.circlemenu_historyforward(), tapAction: { _ in
                    log.debug("circle menu event. event: history forward")
                    self.viewModel.goForwardCommonHistoryDataModel()
                }),
                CircleMenuItem(image: R.image.circlemenu_form(), tapAction: { _ in
                    log.debug("circle menu event. event: form")
                    self.viewModel.executeOperationDataModel(operation: .form)
                }),
                CircleMenuItem(image: R.image.header_favorite(), tapAction: { _ in
                    log.debug("circle menu event. event: favorite")
                    self.viewModel.registerFavoriteDataModel()
                }),
                CircleMenuItem(image: R.image.circlemenu_form(), tapAction: { _ in
                    log.debug("circle menu event. event: form")
                    self.viewModel.executeOperationDataModel(operation: .form)
                })
            ]
        ]
        circleMenu = CircleMenu(frame: CGRect(origin: CGPoint(x: -100, y: -100), size: CGSize(width: kCircleButtonRadius, height: kCircleButtonRadius)) ,menuItems: menuItems, swipeDirection: swipeDirection)
        circleMenu.delegate = self
        addSubview(circleMenu)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: Button Event
    @objc func tappedOverlay(_ sender: AnyObject) {
        optionMenuTableViewDidClose()
    }
}

// MARK: OptionMenuTableView Delegate
extension FrontLayer: OptionMenuTableViewDelegate {
    func optionMenuTableViewDidClose() {
        circleMenu.invalidate()
        UIView.animate(withDuration: 0.15, animations: {
            self.overlay.alpha = 0
            self.optionMenu?.alpha = 0
            self.alpha = 0
        }, completion: { (finished) in
            if finished {
                self.optionMenu?.removeFromSuperview()
                self.optionMenu = nil
                self.delegate?.frontLayerDidInvalidate()
            }
        })
    }
}

// MARK: CircleMenuDelegate
extension FrontLayer: CircleMenuDelegate {
    func circleMenuDidActive() {
        // オーバーレイの作成
        overlay = UIButton(frame: frame)
        overlay.backgroundColor = UIColor.darkGray
        self.overlay.alpha = 0
        overlay.addTarget(self, action: #selector(self.tappedOverlay(_:)), for: .touchUpInside)
        addSubview(overlay)
        // addSubviewした段階だと、サークルメニューより前面に配置されているので、最背面に移動する
        sendSubview(toBack: overlay)
        UIView.animate(withDuration: 0.35) {
            self.overlay.alpha = 0.2
        }
    }
    
    func circleMenuDidClose() {
        if self.optionMenu == nil {
            if let overlay = overlay {
                UIView.animate(withDuration: 0.15, animations: {
                    // ここでおちる
                    overlay.alpha = 0
                }, completion: { (finished) in
                    if finished {
                        self.delegate?.frontLayerDidInvalidate()
                    }
                })
            } else {
                self.delegate?.frontLayerDidInvalidate()
            }
        }
    }
}
