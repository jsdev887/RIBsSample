//
//  MainRouter.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol MainInteractable: Interactable, FirstChildListener, SecondChildListener, ThirdChildListener, FourthChildListener {
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
                  secondBuildable: SecondChildBuildable,
                  thirdBuildable: ThirdChildBuildable,
                  fourthBuildable: FourthChildBuildable) {
        
        let navController = UINavigationController(root: viewController)
        
        self.firstChildBuilder = firstBuildable
        self.secondChildBuilder = secondBuildable
        self.thirdChildBuilder = thirdBuildable
        self.fourthChildBuilder = fourthBuildable
        
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
        tree()

    }
    
    func routeToSecondChild() {
        removeCurrentChild()
        
        print("PresentViewController - 3. Call a function to show")
        
        let second = secondChildBuilder.build(withListener: interactor)
        self.child = second
        attachChild(second)
        viewController.showModal(viewController: second.viewControllable)
        tree()
    }
    
    func routeToThirdChild() {
        removeCurrentChild()
        
        print("Passing Data - 3. Call a function to show")
        
        let third = thirdChildBuilder.build(withListener: interactor)
        self.child = third
        attachChild(third)
        viewController.showModal(viewController: third.viewControllable)
        tree()

    }
    
    func routeToFourthChild() {
        removeCurrentChild()
        
        print("Passing Data - 3. Call a function to show")
        
        let fourth = fourthChildBuilder.build(withListener: interactor)
        self.child = fourth
        attachChild(fourth)
        viewController.showModal(viewController: fourth.viewControllable)
        tree()

    }
    
    // MARK: Private
    
    private var firstChildBuilder: FirstChildBuildable
    private var secondChildBuilder: SecondChildBuildable
    private var thirdChildBuilder: ThirdChildBuildable
    private var fourthChildBuilder: FourthChildBuildable
    private var child: ViewableRouting?
    
    private func removeCurrentChild() {
        if let child = self.child {
            detachChild(child)
            self.child = nil
        }
    }
}
