//
//  FooterView.swift
//  Eiger
//
//  Created by temma on 2017/03/05.
//  Copyright © 2017年 eifaniori. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import RxCocoa
import RxSwift
import UIKit

class FooterView: UIView, ShadowView {
    private var viewModel = FooterViewModel()
    private var collectionView: UICollectionView!
    private var isDragging = false

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup(frame: frame)
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        log.debug("deinit called.")
    }

    private func setup(frame: CGRect) {
        // layout
        addAreaShadow()
        backgroundColor = UIColor.lightGray

        // cell layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: AppConst.BASE_LAYER.THUMBNAIL_SIZE.width, height: frame.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        collectionView = UICollectionView(frame: CGRect(origin: CGPoint.zero, size: frame.size), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(R.nib.footerCollectionViewCell(), forCellWithReuseIdentifier: R.nib.footerCollectionViewCell.identifier)
        // タイトル用に、スクロールビューの領域外に配置できるようにする
        collectionView.clipsToBounds = false
        addSubview(collectionView)

        setupRx()
    }

    private func setupRx() {
        // サムネイル監視
        viewModel.rx_action
            .subscribe { [weak self] action in
                log.eventIn(chain: "FooterViewModel.rx_action")
                guard let `self` = self, let action = action.element else { return }
                switch action {
                case let .update(indexPath, animated): self.update(indexPath: indexPath, animated: animated)
                case let .append(indexPath): self.append(indexPath: indexPath)
                case let .insert(indexPath): self.insert(indexPath: indexPath)
                case let .delete(indexPath): self.delete(indexPath: indexPath)
                default: break
                }
                log.eventOut(chain: "FooterViewModel.rx_action")
            }
            .disposed(by: rx.disposeBag)
    }

    /// アペンド
    private func append(indexPath: IndexPath) {
        DispatchQueue.mainSyncSafe {
            self.collectionView.insertItems(at: [indexPath])
            self.viewModel.updateFrontBar()
        }
    }

    /// 挿入
    private func insert(indexPath: IndexPath) {
        DispatchQueue.mainSyncSafe {
            self.collectionView.insertItems(at: [indexPath])
            self.viewModel.updateFrontBar()
        }
    }

    /// 削除
    private func delete(indexPath: IndexPath) {
        DispatchQueue.mainSyncSafe {
            self.collectionView.deleteItems(at: [indexPath])
            self.viewModel.updateFrontBar()
        }
    }

    /// 画面更新
    private func update(indexPath: [IndexPath]?, animated: Bool) {
        if let indexPath = indexPath {
            // 部分更新
            DispatchQueue.mainSyncSafe {
                if animated {
                    collectionView.reloadItems(at: indexPath)
                } else {
                    UIView.performWithoutAnimation {
                        collectionView.reloadItems(at: indexPath)
                    }
                }
            }
        } else {
            // 全更新
            DispatchQueue.mainSyncSafe {
                if animated {
                    collectionView.reloadData()
                } else {
                    UIView.performWithoutAnimation {
                        collectionView.reloadData()
                    }
                }
            }
        }
    }
}

extension FooterView: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return viewModel.cellCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = R.nib.footerCollectionViewCell.identifier
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FooterCollectionViewCell
        // swiftlint:enable force_cast
        cell.setRow(row: viewModel.getRow(indexPath: indexPath))
        return cell
    }
}

extension FooterView: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.change(indexPath: indexPath)
    }
}

// cellのサイズの設定
extension FooterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        let isRequireLeftMargin = (AppConst.BASE_LAYER.THUMBNAIL_SIZE.width * CGFloat(viewModel.cellCount)) < bounds.size.width
        if isRequireLeftMargin {
            let leftMargin = (bounds.size.width - (AppConst.BASE_LAYER.THUMBNAIL_SIZE.width * CGFloat(viewModel.cellCount))) / 2
            return UIEdgeInsets(top: 0, left: leftMargin, bottom: 0, right: 0)
        } else {
            return .zero
        }
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: AppConst.BASE_LAYER.THUMBNAIL_SIZE.width, height: frame.height)
    }
}

// MARK: ScrollView Delegate

extension FooterView: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_: UIScrollView) {
        viewModel.startDragging()
        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }

    func scrollViewDidEndDragging(_: UIScrollView, willDecelerate _: Bool) {
        viewModel.endDragging()
        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }
}

// class FooterView: UIView, ShadowView {
//    private var viewModel = FooterViewModel()
//    private let scrollView = UIScrollView()
//    private var thumbnails: [Thumbnail] = []
//    /// 削除アニメーションは、連続で実行されるので制御する
//    private var deleteAnimator: UIViewPropertyAnimator?
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        addAreaShadow()
//
//        backgroundColor = UIColor.lightGray
//        scrollView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: frame.size)
//        scrollView.delegate = self // スクロールビューはなんか怖いのでrx化しない
//        scrollView.contentSize = CGSize(width: frame.size.width + 1, height: frame.size.height)
//        scrollView.bounces = true
//        scrollView.backgroundColor = UIColor.clear
//        scrollView.isPagingEnabled = false
//        scrollView.isUserInteractionEnabled = true
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.showsHorizontalScrollIndicator = false
//
//        addSubview(scrollView)
//        // サムネイル説明用に、スクロールビューの領域外に配置できるようにする
//        scrollView.clipsToBounds = false
//
//        setupRx()
//
//        // 初期ロード
//        load()
//    }
//
//    private func setupRx() {
//        // サムネイル追加監視
//        viewModel.rx_footerViewModelDidAppendThumbnail
//            .observeOn(MainScheduler.asyncInstance)
//            .subscribe { [weak self] object in
//                log.eventIn(chain: "rx_footerViewModelDidAppendThumbnail")
//                guard let `self` = self else { return }
//                if let pageHistory = object.element {
//                    // 新しいサムネイルスペースを作成
//                    _ = self.append(context: pageHistory.context)
//                    self.updateFrontBar(to: pageHistory.context)
//                }
//                log.eventOut(chain: "rx_footerViewModelDidAppendThumbnail")
//            }
//            .disposed(by: rx.disposeBag)
//
//        // サムネイル変更監視
//        viewModel.rx_footerViewModelDidChangeThumbnail
//            .observeOn(MainScheduler.asyncInstance)
//            .subscribe { [weak self] object in
//                log.eventIn(chain: "rx_footerViewModelDidChangeThumbnail")
//                guard let `self` = self else { return }
//                if let context = object.element {
//                    self.updateFrontBar(to: context)
//                }
//                log.eventOut(chain: "rx_footerViewModelDidChangeThumbnail")
//            }
//            .disposed(by: rx.disposeBag)
//
//        // サムネイルインサート監視
//        viewModel.rx_footerViewModelDidInsertThumbnail
//            .observeOn(MainScheduler.asyncInstance)
//            .subscribe { [weak self] object in
//                log.eventIn(chain: "rx_footerViewModelDidInsertThumbnail")
//                guard let `self` = self else { return }
//                if let object = object.element {
//                    // 新しいサムネイルスペースを作成
//                    _ = self.insert(at: object.at, context: object.pageHistory.context)
//                    self.updateFrontBar(to: object.pageHistory.context)
//                }
//                log.eventOut(chain: "rx_footerViewModelDidInsertThumbnail")
//            }
//            .disposed(by: rx.disposeBag)
//
//        // サムネイル削除監視
//        viewModel.rx_footerViewModelDidRemoveThumbnail
//            .observeOn(MainScheduler.asyncInstance) // アニメーションさせるのでメインスレッドで実行
//            .subscribe { [weak self] object in
//                log.eventIn(chain: "rx_footerViewModelDidRemoveThumbnail")
//                guard let `self` = self else { return }
//                if let object = object.element {
//                    if let deleteIndex = self.thumbnails.index(where: { $0.context == object.deleteContext }) {
//                        self.thumbnails[deleteIndex].removeFromSuperview()
//                        self.thumbnails.remove(at: deleteIndex)
//                        self.updateFrontBar(to: object.currentContext)
//
//                        if self.thumbnails.count == 0 {
//                            if (self.thumbnails.count + 1).f * AppConst.BASE_LAYER.THUMBNAIL_SIZE.width > self.scrollView.frame.size.width {
//                                self.scrollView.contentSize.width -= AppConst.BASE_LAYER.THUMBNAIL_SIZE.width / 2
//                                self.scrollView.contentInset = UIEdgeInsets(top: 0, left: self.scrollView.contentInset.left - (AppConst.BASE_LAYER.THUMBNAIL_SIZE.width / 2), bottom: 0, right: 0)
//                            }
//                        } else {
//                            if let deleteAnimator = self.deleteAnimator {
//                                // アニメーション実行中であれば、強制的に完了にする
//                                deleteAnimator.fractionComplete = 1
//                            }
//                            self.deleteAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .linear) {
//                                if (self.thumbnails.count + 1).f * AppConst.BASE_LAYER.THUMBNAIL_SIZE.width > self.scrollView.frame.size.width {
//                                    self.scrollView.contentSize.width -= AppConst.BASE_LAYER.THUMBNAIL_SIZE.width / 2
//                                    self.scrollView.contentInset = UIEdgeInsets(top: 0, left: self.scrollView.contentInset.left - (AppConst.BASE_LAYER.THUMBNAIL_SIZE.width / 2), bottom: 0, right: 0)
//                                }
//
//                                (0 ... self.thumbnails.count - 1).forEach {
//                                    if $0 < deleteIndex {
//                                        self.thumbnails[$0].center.x += self.thumbnails[$0].frame.size.width / 2
//                                    } else if $0 >= deleteIndex {
//                                        self.thumbnails[$0].center.x -= self.thumbnails[$0].frame.size.width / 2
//                                    }
//                                }
//                            }
//                            self.deleteAnimator!.addCompletion { _ in
//                                self.deleteAnimator = nil
//                            }
//                            self.deleteAnimator!.startAnimation()
//                        }
//                    } else {
//                        log.error("delete context not found.")
//                    }
//                }
//                log.eventOut(chain: "rx_footerViewModelDidRemoveThumbnail")
//            }
//            .disposed(by: rx.disposeBag)
//
//        // ローディングスタート監視
//        viewModel.rx_footerViewModelDidStartLoading
//            .observeOn(MainScheduler.asyncInstance)
//            .subscribe { [weak self] object in
//                log.eventIn(chain: "rx_footerViewModelDidStartLoading")
//                guard let `self` = self else { return }
//                if let context = object.element {
//                    self.startIndicator(context: context)
//                }
//                log.eventOut(chain: "rx_footerViewModelDidStartLoading")
//            }
//            .disposed(by: rx.disposeBag)
//
//        // ローティング終了監視
//        viewModel.rx_footerViewModelDidEndLoading
//            .observeOn(MainScheduler.asyncInstance)
//            .subscribe { [weak self] object in
//                log.eventIn(chain: "rx_footerViewModelDidEndLoading")
//                guard let `self` = self else { return }
//                if let tuple = object.element {
//                    // くるくるを止めて、サムネイルを表示する
//                    let targetThumbnail: Thumbnail = self.thumbnails.filter({ (thumbnail) -> Bool in
//                        thumbnail.context == tuple.context
//                    })[0]
//                    let existIndicator = targetThumbnail.subviews.filter { (view) -> Bool in return view is NVActivityIndicatorView }.count > 0
//                    if existIndicator {
//                        DispatchQueue.mainSyncSafe { [weak self] in
//                            guard let `self` = self else { return }
//                            targetThumbnail.subviews.forEach({ v in
//                                if NSStringFromClass(type(of: v)) == "NVActivityIndicatorView.NVActivityIndicatorView" {
//                                    if let indicator = v as? NVActivityIndicatorView {
//                                        indicator.stopAnimating()
//                                        indicator.alpha = 0
//                                        indicator.removeFromSuperview()
//                                    }
//                                }
//                            })
//                            targetThumbnail.setThumbnailTitle(title: tuple.title)
//                            if let image = self.viewModel.getThumbnail(context: tuple.context) {
//                                targetThumbnail.setImage(nil, for: .normal)
//                                targetThumbnail.setBackgroundImage(image, for: .normal)
//                            } else {
//                                log.error("missing thumbnail image")
//                            }
//                        }
//                    }
//                }
//                log.eventOut(chain: "rx_footerViewModelDidEndLoading")
//            }
//            .disposed(by: rx.disposeBag)
//    }
//
//    required init(coder _: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    deinit {
//        log.debug("deinit called.")
//    }
//
//    // MARK: Private Method
//
//    /// 現在地にスクロール
//    private func scrollAtCurrent() {
//        if let currentLocation = viewModel.currentLocation {
//            var ptX = -scrollView.contentInset.left + (currentLocation.f * AppConst.BASE_LAYER.THUMBNAIL_SIZE.width)
//            if ptX > scrollView.contentSize.width - frame.width + scrollView.contentInset.right {
//                ptX = scrollView.contentSize.width - frame.width + scrollView.contentInset.right
//            }
//            let offset = CGPoint(x: ptX, y: scrollView.contentOffset.y)
//            scrollView.setContentOffset(offset, animated: true)
//        }
//    }
//
//    /// 初期ロード
//    private func load() {
//        viewModel.pageHistories.forEach {
//            let btn = append(context: $0.context)
//            if !$0.context.isEmpty {
//                // コンテキストが存在しないのは、新規作成後にwebview作らずにアプリを終了した場合
//                if let image = viewModel.getThumbnail(context: $0.context) {
//                    btn.setImage(nil, for: .normal)
//                    btn.setBackgroundImage(image, for: .normal)
//                    btn.setThumbnailTitle(title: $0.title)
//                }
//            }
//        }
//        updateFrontBar(to: viewModel.currentContext)
//        // スクロールする
//        scrollAtCurrent()
//    }
//
//    /// 新しいサムネイル追加
//    private func append(context: String) -> Thumbnail {
//        // 後ろに追加
//        let basePtX = ((thumbnails.count).f * AppConst.BASE_LAYER.THUMBNAIL_SIZE.width)
//        let additionalPtX = (thumbnails.count - 1 < 0 ? 0 : thumbnails.count - 1).f * AppConst.BASE_LAYER.THUMBNAIL_SIZE.width / 2
//        let btnPtX = (frame.size.width / 2) - (AppConst.BASE_LAYER.THUMBNAIL_SIZE.width / 2.0) + (basePtX - additionalPtX)
//        let btn = Thumbnail(frame: CGRect(origin: CGPoint(x: btnPtX, y: 0), size: AppConst.BASE_LAYER.THUMBNAIL_SIZE))
//        btn.context = context
//
//        // セットアップ
//        setUpThumbnail(thumbnail: btn)
//
//        thumbnails.append(btn)
//
//        // スクロールビューのコンテンツサイズを大きくする
//        if (thumbnails.count).f * btn.frame.size.width > scrollView.frame.size.width {
//            scrollView.contentSize.width += btn.frame.size.width / 2
//            scrollView.contentInset = UIEdgeInsets(top: 0, left: scrollView.contentInset.left + (btn.frame.size.width / 2), bottom: 0, right: 0)
//        }
//
//        scrollView.addSubview(btn)
//
//        if thumbnails.count > 1 {
//            for thumbnail in thumbnails {
//                UIView.animate(withDuration: 0.3, animations: {
//                    thumbnail.center.x -= thumbnail.frame.size.width / 2
//                })
//            }
//        }
//
//        scrollView.scroll(to: .right, animated: true)
//        return btn
//    }
//
//    /// 新しいサムネイル挿入
//    private func insert(at: Int, context: String) -> Thumbnail {
//        // スペースを空けるアニメーション
//        if thumbnails.count > 1 {
//            for (index, thumbnail) in thumbnails.enumerated() {
//                if index < at {
//                    UIView.animate(withDuration: 0.3, animations: {
//                        thumbnail.center.x -= thumbnail.frame.size.width / 2
//                    })
//                } else {
//                    UIView.animate(withDuration: 0.3, animations: {
//                        thumbnail.center.x += thumbnail.frame.size.width / 2
//                    })
//                }
//            }
//        }
//
//        // 間に挿入
//        let preBtn = thumbnails[at - 1] // 左隣のボタン
//        let btn = Thumbnail(frame: CGRect(origin: CGPoint(x: preBtn.frame.origin.x + AppConst.BASE_LAYER.THUMBNAIL_SIZE.width, y: AppConst.BASE_LAYER.THUMBNAIL_SIZE.height), size: AppConst.BASE_LAYER.THUMBNAIL_SIZE)) // 下から表示するアニメーションにするので、yは0ではない
//        btn.context = context
//
//        // セットアップ
//        setUpThumbnail(thumbnail: btn)
//
//        thumbnails.insert(btn, at: at)
//
//        // スクロールビューのコンテンツサイズを大きくする
//        if (thumbnails.count).f * btn.frame.size.width > scrollView.frame.size.width {
//            scrollView.contentSize.width += btn.frame.size.width / 2
//            scrollView.contentInset = UIEdgeInsets(top: 0, left: scrollView.contentInset.left + (btn.frame.size.width / 2), bottom: 0, right: 0)
//        }
//
//        scrollView.addSubview(btn)
//
//        // 挿入アニメーション
//        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveLinear, animations: {
//            btn.frame.origin.y = 0
//        }, completion: nil)
//
//        scrollAtCurrent()
//
//        return btn
//    }
//
//    private func startIndicator(context: String) {
//        if let targetThumbnail = thumbnails.find({ $0.context == context }) {
//            // くるくるを表示する
//            let existIndicator = targetThumbnail.subviews.filter { (view) -> Bool in return view is NVActivityIndicatorView }.count > 0
//            if !existIndicator {
//                let rect = CGRect(x: 0, y: 0, width: AppConst.BASE_LAYER.THUMBNAIL_SIZE.height * 0.7, height: AppConst.BASE_LAYER.THUMBNAIL_SIZE.height * 0.7)
//                let indicator = NVActivityIndicatorView(frame: rect, type: NVActivityIndicatorType.ballClipRotate, color: UIColor.ultraViolet, padding: 0)
//                indicator.center = CGPoint(x: targetThumbnail.bounds.size.width / 2, y: targetThumbnail.bounds.size.height / 2)
//                indicator.isUserInteractionEnabled = false
//                targetThumbnail.addSubview(indicator)
//                indicator.startAnimating()
//            }
//        }
//    }
//
//    /// サムネイルセットアップ
//    private func setUpThumbnail(thumbnail: Thumbnail) {
//        thumbnail.backgroundColor = UIColor.darkGray
//        thumbnail.setImage(image: R.image.footerThumbnailBack(), color: UIColor.gray)
//        let inset: CGFloat = thumbnail.frame.size.width / 9
//        thumbnail.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
//
//        // ボタンタップ
//        thumbnail.rx.tap
//            .subscribe(onNext: { [weak self] in
//                guard let `self` = self else { return }
//                let tappedContext = thumbnail.context
//                if tappedContext == self.viewModel.currentContext {
//                    log.debug("selected same page.")
//                } else {
//                    self.viewModel.change(context: thumbnail.context)
//                }
//            })
//            .disposed(by: rx.disposeBag)
//
//        let longPressRecognizer = UILongPressGestureRecognizer()
//
//        // ロングプレス
//        longPressRecognizer.rx.event
//            .subscribe { [weak self] sender in
//                log.eventIn(chain: "rx_longPress")
//                guard let `self` = self else { return }
//                if let sender = sender.element {
//                    if sender.state == .began {
//                        for thumbnail in self.thumbnails where sender.view == thumbnail {
//                            self.viewModel.isReplacing = true
//                            self.scrollView.bringSubview(toFront: thumbnail)
//                            thumbnail.float()
////                            self.viewModel.remove(context: thumbnail.context)
//                            break
//                        }
//                    }
//                }
//                log.eventOut(chain: "rx_longPress")
//            }
//            .disposed(by: rx.disposeBag)
//
//        thumbnail.addGestureRecognizer(longPressRecognizer)
//    }
//
//    /// フロントバーの変更
//    private func updateFrontBar(to: String?) {
//        thumbnails.forEach({ $0.isFront = $0.context == to })
//    }
// }
//
//// MARK: ScrollView Delegate
//
// extension FooterView: UIScrollViewDelegate {
//    func scrollViewWillBeginDragging(_: UIScrollView) {
//        thumbnails.forEach { thumbnail in
//            thumbnail.displayTitle()
//        }
//    }
//
//    func scrollViewDidEndDragging(_: UIScrollView, willDecelerate _: Bool) {
//        thumbnails.forEach { thumbnail in
//            thumbnail.undisplayTitle()
//        }
//    }
// }
