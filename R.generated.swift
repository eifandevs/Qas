//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 5 files.
  struct file {
    /// Resource file `authorize.html`.
    static let authorizeHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "authorize", pathExtension: "html")
    /// Resource file `dns.html`.
    static let dnsHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "dns", pathExtension: "html")
    /// Resource file `invalid.html`.
    static let invalidHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "invalid", pathExtension: "html")
    /// Resource file `offline.html`.
    static let offlineHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "offline", pathExtension: "html")
    /// Resource file `timeout.html`.
    static let timeoutHtml = Rswift.FileResource(bundle: R.hostingBundle, name: "timeout", pathExtension: "html")
    
    /// `bundle.url(forResource: "authorize", withExtension: "html")`
    static func authorizeHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.authorizeHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "dns", withExtension: "html")`
    static func dnsHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dnsHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "invalid", withExtension: "html")`
    static func invalidHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.invalidHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "offline", withExtension: "html")`
    static func offlineHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.offlineHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "timeout", withExtension: "html")`
    static func timeoutHtml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.timeoutHtml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 29 images.
  struct image {
    /// Image `circlemenu_add_private`.
    static let circlemenu_add_private = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_add_private")
    /// Image `circlemenu_add`.
    static let circlemenu_add = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_add")
    /// Image `circlemenu_autoscroll`.
    static let circlemenu_autoscroll = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_autoscroll")
    /// Image `circlemenu_close`.
    static let circlemenu_close = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_close")
    /// Image `circlemenu_copy`.
    static let circlemenu_copy = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_copy")
    /// Image `circlemenu_form`.
    static let circlemenu_form = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_form")
    /// Image `circlemenu_historyback`.
    static let circlemenu_historyback = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_historyback")
    /// Image `circlemenu_historyforward`.
    static let circlemenu_historyforward = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_historyforward")
    /// Image `circlemenu_menu`.
    static let circlemenu_menu = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_menu")
    /// Image `circlemenu_search`.
    static let circlemenu_search = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_search")
    /// Image `circlemenu_url`.
    static let circlemenu_url = Rswift.ImageResource(bundle: R.hostingBundle, name: "circlemenu_url")
    /// Image `footer_back`.
    static let footer_back = Rswift.ImageResource(bundle: R.hostingBundle, name: "footer_back")
    /// Image `footer_private`.
    static let footer_private = Rswift.ImageResource(bundle: R.hostingBundle, name: "footer_private")
    /// Image `header_close`.
    static let header_close = Rswift.ImageResource(bundle: R.hostingBundle, name: "header_close")
    /// Image `header_favorite_selected`.
    static let header_favorite_selected = Rswift.ImageResource(bundle: R.hostingBundle, name: "header_favorite_selected")
    /// Image `header_favorite`.
    static let header_favorite = Rswift.ImageResource(bundle: R.hostingBundle, name: "header_favorite")
    /// Image `key`.
    static let key = Rswift.ImageResource(bundle: R.hostingBundle, name: "key")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `option_menu_add`.
    static let option_menu_add = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_add")
    /// Image `option_menu_copy`.
    static let option_menu_copy = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_copy")
    /// Image `option_menu_form`.
    static let option_menu_form = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_form")
    /// Image `option_menu_help`.
    static let option_menu_help = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_help")
    /// Image `option_menu_history`.
    static let option_menu_history = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_history")
    /// Image `option_menu_initialize`.
    static let option_menu_initialize = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_initialize")
    /// Image `option_menu_mail`.
    static let option_menu_mail = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_mail")
    /// Image `option_menu_setting`.
    static let option_menu_setting = Rswift.ImageResource(bundle: R.hostingBundle, name: "option_menu_setting")
    /// Image `optionmenu_app`.
    static let optionmenu_app = Rswift.ImageResource(bundle: R.hostingBundle, name: "optionmenu_app")
    /// Image `optionmenu_favorite`.
    static let optionmenu_favorite = Rswift.ImageResource(bundle: R.hostingBundle, name: "optionmenu_favorite")
    /// Image `optionmenu_private`.
    static let optionmenu_private = Rswift.ImageResource(bundle: R.hostingBundle, name: "optionmenu_private")
    
    /// `UIImage(named: "circlemenu_add", bundle: ..., traitCollection: ...)`
    static func circlemenu_add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_add, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_add_private", bundle: ..., traitCollection: ...)`
    static func circlemenu_add_private(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_add_private, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_autoscroll", bundle: ..., traitCollection: ...)`
    static func circlemenu_autoscroll(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_autoscroll, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_close", bundle: ..., traitCollection: ...)`
    static func circlemenu_close(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_close, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_copy", bundle: ..., traitCollection: ...)`
    static func circlemenu_copy(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_copy, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_form", bundle: ..., traitCollection: ...)`
    static func circlemenu_form(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_form, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_historyback", bundle: ..., traitCollection: ...)`
    static func circlemenu_historyback(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_historyback, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_historyforward", bundle: ..., traitCollection: ...)`
    static func circlemenu_historyforward(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_historyforward, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_menu", bundle: ..., traitCollection: ...)`
    static func circlemenu_menu(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_menu, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_search", bundle: ..., traitCollection: ...)`
    static func circlemenu_search(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_search, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "circlemenu_url", bundle: ..., traitCollection: ...)`
    static func circlemenu_url(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circlemenu_url, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "footer_back", bundle: ..., traitCollection: ...)`
    static func footer_back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.footer_back, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "footer_private", bundle: ..., traitCollection: ...)`
    static func footer_private(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.footer_private, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "header_close", bundle: ..., traitCollection: ...)`
    static func header_close(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.header_close, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "header_favorite", bundle: ..., traitCollection: ...)`
    static func header_favorite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.header_favorite, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "header_favorite_selected", bundle: ..., traitCollection: ...)`
    static func header_favorite_selected(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.header_favorite_selected, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "key", bundle: ..., traitCollection: ...)`
    static func key(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.key, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_add", bundle: ..., traitCollection: ...)`
    static func option_menu_add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_add, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_copy", bundle: ..., traitCollection: ...)`
    static func option_menu_copy(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_copy, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_form", bundle: ..., traitCollection: ...)`
    static func option_menu_form(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_form, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_help", bundle: ..., traitCollection: ...)`
    static func option_menu_help(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_help, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_history", bundle: ..., traitCollection: ...)`
    static func option_menu_history(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_history, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_initialize", bundle: ..., traitCollection: ...)`
    static func option_menu_initialize(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_initialize, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_mail", bundle: ..., traitCollection: ...)`
    static func option_menu_mail(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_mail, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "option_menu_setting", bundle: ..., traitCollection: ...)`
    static func option_menu_setting(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.option_menu_setting, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "optionmenu_app", bundle: ..., traitCollection: ...)`
    static func optionmenu_app(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.optionmenu_app, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "optionmenu_favorite", bundle: ..., traitCollection: ...)`
    static func optionmenu_favorite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.optionmenu_favorite, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "optionmenu_private", bundle: ..., traitCollection: ...)`
    static func optionmenu_private(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.optionmenu_private, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 18 nibs.
  struct nib {
    /// Nib `HeaderView`.
    static let headerView = _R.nib._HeaderView()
    /// Nib `HelpViewController`.
    static let helpViewController = _R.nib._HelpViewController()
    /// Nib `OptionMenuAppTableViewCell`.
    static let optionMenuAppTableViewCell = _R.nib._OptionMenuAppTableViewCell()
    /// Nib `OptionMenuAppTableView`.
    static let optionMenuAppTableView = _R.nib._OptionMenuAppTableView()
    /// Nib `OptionMenuFavoriteTableViewCell`.
    static let optionMenuFavoriteTableViewCell = _R.nib._OptionMenuFavoriteTableViewCell()
    /// Nib `OptionMenuFavoriteTableView`.
    static let optionMenuFavoriteTableView = _R.nib._OptionMenuFavoriteTableView()
    /// Nib `OptionMenuFormTableViewCell`.
    static let optionMenuFormTableViewCell = _R.nib._OptionMenuFormTableViewCell()
    /// Nib `OptionMenuFormTableView`.
    static let optionMenuFormTableView = _R.nib._OptionMenuFormTableView()
    /// Nib `OptionMenuHelpTableViewCell`.
    static let optionMenuHelpTableViewCell = _R.nib._OptionMenuHelpTableViewCell()
    /// Nib `OptionMenuHelpTableView`.
    static let optionMenuHelpTableView = _R.nib._OptionMenuHelpTableView()
    /// Nib `OptionMenuHistoryTableViewCell`.
    static let optionMenuHistoryTableViewCell = _R.nib._OptionMenuHistoryTableViewCell()
    /// Nib `OptionMenuHistoryTableView`.
    static let optionMenuHistoryTableView = _R.nib._OptionMenuHistoryTableView()
    /// Nib `OptionMenuSettingSliderTableViewCell`.
    static let optionMenuSettingSliderTableViewCell = _R.nib._OptionMenuSettingSliderTableViewCell()
    /// Nib `OptionMenuSettingTableViewCell`.
    static let optionMenuSettingTableViewCell = _R.nib._OptionMenuSettingTableViewCell()
    /// Nib `OptionMenuSettingTableView`.
    static let optionMenuSettingTableView = _R.nib._OptionMenuSettingTableView()
    /// Nib `OptionMenuTableViewCell`.
    static let optionMenuTableViewCell = _R.nib._OptionMenuTableViewCell()
    /// Nib `OptionMenuTableView`.
    static let optionMenuTableView = _R.nib._OptionMenuTableView()
    /// Nib `SplashViewController`.
    static let splashViewController = _R.nib._SplashViewController()
    
    /// `UINib(name: "HeaderView", in: bundle)`
    static func headerView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.headerView)
    }
    
    /// `UINib(name: "HelpViewController", in: bundle)`
    static func helpViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.helpViewController)
    }
    
    /// `UINib(name: "OptionMenuAppTableView", in: bundle)`
    static func optionMenuAppTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuAppTableView)
    }
    
    /// `UINib(name: "OptionMenuAppTableViewCell", in: bundle)`
    static func optionMenuAppTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuAppTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuFavoriteTableView", in: bundle)`
    static func optionMenuFavoriteTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuFavoriteTableView)
    }
    
    /// `UINib(name: "OptionMenuFavoriteTableViewCell", in: bundle)`
    static func optionMenuFavoriteTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuFavoriteTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuFormTableView", in: bundle)`
    static func optionMenuFormTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuFormTableView)
    }
    
    /// `UINib(name: "OptionMenuFormTableViewCell", in: bundle)`
    static func optionMenuFormTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuFormTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuHelpTableView", in: bundle)`
    static func optionMenuHelpTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuHelpTableView)
    }
    
    /// `UINib(name: "OptionMenuHelpTableViewCell", in: bundle)`
    static func optionMenuHelpTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuHelpTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuHistoryTableView", in: bundle)`
    static func optionMenuHistoryTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuHistoryTableView)
    }
    
    /// `UINib(name: "OptionMenuHistoryTableViewCell", in: bundle)`
    static func optionMenuHistoryTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuHistoryTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuSettingSliderTableViewCell", in: bundle)`
    static func optionMenuSettingSliderTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuSettingSliderTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuSettingTableView", in: bundle)`
    static func optionMenuSettingTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuSettingTableView)
    }
    
    /// `UINib(name: "OptionMenuSettingTableViewCell", in: bundle)`
    static func optionMenuSettingTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuSettingTableViewCell)
    }
    
    /// `UINib(name: "OptionMenuTableView", in: bundle)`
    static func optionMenuTableView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuTableView)
    }
    
    /// `UINib(name: "OptionMenuTableViewCell", in: bundle)`
    static func optionMenuTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.optionMenuTableViewCell)
    }
    
    /// `UINib(name: "SplashViewController", in: bundle)`
    static func splashViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.splashViewController)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 8 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `OptionMenuAppCell`.
    static let optionMenuAppCell: Rswift.ReuseIdentifier<OptionMenuAppTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuAppCell")
    /// Reuse identifier `OptionMenuCell`.
    static let optionMenuCell: Rswift.ReuseIdentifier<OptionMenuTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuCell")
    /// Reuse identifier `OptionMenuFavoriteCell`.
    static let optionMenuFavoriteCell: Rswift.ReuseIdentifier<OptionMenuFavoriteTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuFavoriteCell")
    /// Reuse identifier `OptionMenuFormCell`.
    static let optionMenuFormCell: Rswift.ReuseIdentifier<OptionMenuFormTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuFormCell")
    /// Reuse identifier `OptionMenuHelpCell`.
    static let optionMenuHelpCell: Rswift.ReuseIdentifier<OptionMenuHelpTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuHelpCell")
    /// Reuse identifier `OptionMenuHistoryCell`.
    static let optionMenuHistoryCell: Rswift.ReuseIdentifier<OptionMenuHistoryTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuHistoryCell")
    /// Reuse identifier `OptionMenuSettingCell`.
    static let optionMenuSettingCell: Rswift.ReuseIdentifier<OptionMenuSettingTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuSettingCell")
    /// Reuse identifier `OptionMenuSettingSliderCell`.
    static let optionMenuSettingSliderCell: Rswift.ReuseIdentifier<OptionMenuSettingSliderTableViewCell> = Rswift.ReuseIdentifier(identifier: "OptionMenuSettingSliderCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R {
  struct nib {
    struct _HeaderView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "HeaderView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _HelpViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "HelpViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuAppTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuAppTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuAppTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuAppTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuAppCell"
      let name = "OptionMenuAppTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuAppTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuAppTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuFavoriteTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuFavoriteTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuFavoriteTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuFavoriteTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuFavoriteCell"
      let name = "OptionMenuFavoriteTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuFavoriteTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuFavoriteTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuFormTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuFormTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuFormTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuFormTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuFormCell"
      let name = "OptionMenuFormTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuFormTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuFormTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuHelpTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuHelpTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuHelpTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuHelpTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuHelpCell"
      let name = "OptionMenuHelpTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuHelpTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuHelpTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuHistoryTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuHistoryTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuHistoryTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuHistoryTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuHistoryCell"
      let name = "OptionMenuHistoryTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuHistoryTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuHistoryTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuSettingSliderTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuSettingSliderTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuSettingSliderCell"
      let name = "OptionMenuSettingSliderTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuSettingSliderTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuSettingSliderTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuSettingTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuSettingTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuSettingTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuSettingTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuSettingCell"
      let name = "OptionMenuSettingTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuSettingTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuSettingTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuTableView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OptionMenuTableView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _OptionMenuTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = OptionMenuTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "OptionMenuCell"
      let name = "OptionMenuTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> OptionMenuTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? OptionMenuTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _SplashViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SplashViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
