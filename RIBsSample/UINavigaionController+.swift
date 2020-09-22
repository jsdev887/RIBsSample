//
//  UINavigaionController+.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/15.
//  Copyright © 2020 Guri. All rights reserved.
//

import Foundation
import RIBs

extension UINavigationController: ViewControllable {
    
    public var nav: UIViewController { return self }

    public convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
    
}
