//
//  NotificationManager.swift
//  Qas
//
//  Created by temma on 2017/09/19.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import UIKit

/// 通知マネージャー
class NotificationManager {
    /// トースト表示
    static func presentToastNotification(message: String, isSuccess: Bool) {
        let notificationViewX = 0.f
        let notificationViewY = AppConst.DEVICE.DISPLAY_SIZE.height
        let notificationViewWidth = AppConst.DEVICE.DISPLAY_SIZE.width
        let notificationViewHeight = AppConst.BASE_LAYER.THUMBNAIL_SIZE.height * 0.9
        let notificationViewRect = CGRect(x: notificationViewX, y: notificationViewY, width: notificationViewWidth, height: notificationViewHeight)
        let notificationView = ToastView(frame: notificationViewRect, title: message, isSuccess: isSuccess)
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.window?.rootViewController?.view.addSubview(notificationView)
            notificationView.play()
        }
    }

    /// アラート表示
    /// 選択肢がある場合はこちらを使用する
    static func presentAlert(title: String, message: String, completion: (() -> Void)?) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: MessageConst.COMMON.OK, style: .default, handler: { (_: UIAlertAction!) -> Void in
            completion?()
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: MessageConst.COMMON.CANCEL, style: .cancel, handler: { (_: UIAlertAction!) -> Void in
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        Util.foregroundViewController().present(alert, animated: true, completion: nil)
    }

    static func presentActionSheet(title: String, message: String, completion: (() -> Void)?, cancel: (() -> Void)?) {
        // styleをActionSheetに設定
        let alertSheet = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.actionSheet)

        // 自分の選択肢を生成
        let action1 = UIAlertAction(title: MessageConst.COMMON.OK, style: UIAlertActionStyle.default, handler: {
            (_: UIAlertAction!) in
            completion?()
        })
        let action2 = UIAlertAction(title: MessageConst.COMMON.CANCEL, style: UIAlertActionStyle.cancel, handler: {
            (_: UIAlertAction!) in
            cancel?()
        })

        // アクションを追加.
        alertSheet.addAction(action1)
        alertSheet.addAction(action2)

        Util.foregroundViewController().present(alertSheet, animated: true, completion: nil)
    }
}