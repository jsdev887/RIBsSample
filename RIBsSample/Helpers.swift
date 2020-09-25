//
//  Helpers.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/25.
//  Copyright © 2020 Guri. All rights reserved.
//

import UIKit

extension UIViewController {
  public static var storyboardIdentifier: String {
    return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
  }
}

extension Bundle {  
  public static var framework: Bundle {
    return Bundle(for: DummyViewModel.self)
  }
}

public final class DummyViewModel {}

public enum Storyboard: String {
    case Main

  public func instantiate<VC: UIViewController>(_: VC.Type, inBundle bundle: Bundle = .framework) -> VC {
    guard
        let vc = UIStoryboard(name: self.rawValue, bundle: Bundle(identifier: bundle.bundleIdentifier!))
      .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
    else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }

    return vc
  }
}
