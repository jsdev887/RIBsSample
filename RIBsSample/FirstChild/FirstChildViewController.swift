//
//  SubViewController.swift
//  SetRIBsWithSceneDelegate
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol FirstChildPresentableListener: class {}

final class FirstChildViewController: UIViewController, FirstChildPresentable, FirstChildViewControllable {

    internal static func instantiate() -> FirstChildViewController {
        return Storyboard.Main.instantiate(FirstChildViewController.self)
    }
    
    weak var listener: FirstChildPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PushViewController - 5. First Child View Controller")
    }
}
