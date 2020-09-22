//
//  SecondChildRouter.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/15.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol SecondChildInteractable: Interactable {
    var router: SecondChildRouting? { get set }
    var listener: SecondChildListener? { get set }
}

protocol SecondChildViewControllable: ViewControllable {}

final class SecondChildRouter: ViewableRouter<SecondChildInteractable, SecondChildViewControllable>, SecondChildRouting {

    override init(interactor: SecondChildInteractable, viewController: SecondChildViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
