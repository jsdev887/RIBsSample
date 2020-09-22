//
//  MainViewController.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: class {    
    func tapShowFirstChildButton()
    func tapShowSecondChildButton()
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
    
    @IBAction func onGoToFirstChildButton(_ sender: Any) {
        print("PushViewController - 1. Tap Button")
        listener?.tapShowFirstChildButton()        
    }
    
    @IBAction func onGoToSecondChildButton(_ sender: Any) {
        print("PresentViewController - 1. Tap Button")
        listener?.tapShowSecondChildButton()
    }
    
    
    func present(viewController: ViewControllable) {}
    func showModal(viewController: ViewControllable) {}
    
}

extension UINavigationController: MainViewControllable {
    func present(viewController: ViewControllable) {
        print("PushViewController - 4. Perform pushViewController")
        pushViewController(viewController.uiviewController, animated: true)
    }
    
    func showModal(viewController: ViewControllable) {
        print("PresentViewController - 4. Perform presentViewController")
        present(viewController.uiviewController, animated: true, completion: nil)
    }
}
