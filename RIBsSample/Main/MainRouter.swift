//
//  MainRouter.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol MainInteractable: Interactable, FirstChildListener, SecondChildListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func showModal(viewController: ViewControllable)
}

final class MainRouter: LaunchRouter<MainInteractable, MainViewControllable>, MainRouting {

    init(interactor: MainInteractable,
                  viewController: MainViewControllable,
                  firstBuildable: FirstChildBuildable,
                  secondBuildable: SecondChildBuildable) {
        
        let navController = UINavigationController(root: viewController)
        
        self.firstChildBuilder = firstBuildable
        self.secondChildBuilder = secondBuildable
        
        super.init(interactor: interactor, viewController: navController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    func routeToFirstChild() {
        removeCurrentChild()
        
        print("PushViewController - 3. Call a function to show")
        
        let first = firstChildBuilder.build(withListener: interactor)
        self.child = first
        attachChild(first)
        viewController.present(viewController: first.viewControllable)
    }
    
    func routeToSecondChild() {
        removeCurrentChild()
        
        print("PresentViewController - 3. Call a function to show")
        
        let second = secondChildBuilder.build(withListener: interactor)
        self.child = second
        attachChild(second)
        viewController.showModal(viewController: second.viewControllable)
    }
    
    // MARK: Private
    
    private var firstChildBuilder: FirstChildBuildable
    private var secondChildBuilder: SecondChildBuildable
    private var child: ViewableRouting?
    
    private func removeCurrentChild() {
        if let child = self.child {
            detachChild(child)
            self.child = nil
        }
    }
}
