//
//  FourthChildViewController.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol FourthChildPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class FourthChildViewController: UIViewController, FourthChildPresentable, FourthChildViewControllable {

    weak var listener: FourthChildPresentableListener?
}
