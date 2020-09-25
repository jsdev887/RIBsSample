//
//  SecondChildViewController.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/15.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SecondChildPresentableListener: class {}

final class SecondChildViewController: UIViewController, SecondChildPresentable, SecondChildViewControllable {

    internal static func instantiate() -> SecondChildViewController {
        return Storyboard.Main.instantiate(SecondChildViewController.self)
    }
    
    weak var listener: SecondChildPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PresentViewController - 5. Second Child View Controller")
    }
}
