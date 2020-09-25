//
//  FourthChildRouter.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol FourthChildInteractable: Interactable {
    var router: FourthChildRouting? { get set }
    var listener: FourthChildListener? { get set }
}

protocol FourthChildViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class FourthChildRouter: ViewableRouter<FourthChildInteractable, FourthChildViewControllable>, FourthChildRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: FourthChildInteractable, viewController: FourthChildViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
