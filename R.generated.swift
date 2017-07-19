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
  
  /// This `R.file` struct is generated, and contains static references to 6 files.
  struct file {
    /// Resource file `Info.plist`.
    static let infoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "Info", pathExtension: "plist")
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
    
    /// `bundle.url(forResource: "Info", withExtension: "plist")`
    static func infoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.infoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
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
  
  /// This `R.image` struct is generated, and contains static references to 16 images.
  struct image {
    /// Image `delete_webview`.
    static let delete_webview = Rswift.ImageResource(bundle: R.hostingBundle, name: "delete_webview")
    /// Image `favorite_webview_selected`.
    static let favorite_webview_selected = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_webview_selected")
    /// Image `favorite_webview`.
    static let favorite_webview = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_webview")
    /// Image `header_favorite_selected`.
    static let header_favorite_selected = Rswift.ImageResource(bundle: R.hostingBundle, name: "header_favorite_selected")
    /// Image `header_favorite`.
    static let header_favorite = Rswift.ImageResource(bundle: R.hostingBundle, name: "header_favorite")
    /// Image `historyback_webview`.
    static let historyback_webview = Rswift.ImageResource(bundle: R.hostingBundle, name: "historyback_webview")
    /// Image `historyforward_webview`.
    static let historyforward_webview = Rswift.ImageResource(bundle: R.hostingBundle, name: "historyforward_webview")
    /// Image `key`.
    static let key = Rswift.ImageResource(bundle: R.hostingBundle, name: "key")
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
    
    /// `UIImage(named: "delete_webview", bundle: ..., traitCollection: ...)`
    static func delete_webview(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.delete_webview, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "favorite_webview", bundle: ..., traitCollection: ...)`
    static func favorite_webview(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_webview, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "favorite_webview_selected", bundle: ..., traitCollection: ...)`
    static func favorite_webview_selected(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_webview_selected, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "header_favorite", bundle: ..., traitCollection: ...)`
    static func header_favorite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.header_favorite, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "header_favorite_selected", bundle: ..., traitCollection: ...)`
    static func header_favorite_selected(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.header_favorite_selected, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "historyback_webview", bundle: ..., traitCollection: ...)`
    static func historyback_webview(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.historyback_webview, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "historyforward_webview", bundle: ..., traitCollection: ...)`
    static func historyforward_webview(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.historyforward_webview, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "key", bundle: ..., traitCollection: ...)`
    static func key(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.key, compatibleWith: traitCollection)
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
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
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
