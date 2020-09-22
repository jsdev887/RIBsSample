//
//  FirstChildRouter.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri All rights reserved.
//

import RIBs

protocol FirstChildInteractable: Interactable, MainListener {
    var router: FirstChildRouting? { get set }
    var listener: FirstChildListener? { get set }
}

protocol FirstChildViewControllable: ViewControllable {}

final class FirstChildRouter: ViewableRouter<FirstChildInteractable, FirstChildViewControllable>, FirstChildRouting {
    
    override init(interactor: FirstChildInteractable, viewController: FirstChildViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

