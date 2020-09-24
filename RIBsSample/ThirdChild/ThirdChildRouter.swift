//
//  ThirdChildRouter.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol ThirdChildInteractable: Interactable {
    var router: ThirdChildRouting? { get set }
    var listener: ThirdChildListener? { get set }
}

protocol ThirdChildViewControllable: ViewControllable {
}

final class ThirdChildRouter: ViewableRouter<ThirdChildInteractable, ThirdChildViewControllable>, ThirdChildRouting {

    override init(interactor: ThirdChildInteractable, viewController: ThirdChildViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
