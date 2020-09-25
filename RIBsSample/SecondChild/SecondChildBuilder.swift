//
//  SecondChildBuilder.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/15.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol SecondChildDependency: Dependency {}

final class SecondChildComponent: Component<SecondChildDependency> {}

// MARK: - Builder

protocol SecondChildBuildable: Buildable {
    func build(withListener listener: SecondChildListener) -> SecondChildRouting
}

final class SecondChildBuilder: Builder<SecondChildDependency>, SecondChildBuildable {

    override init(dependency: SecondChildDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SecondChildListener) -> SecondChildRouting {
        let component = SecondChildComponent(dependency: dependency)
        let viewController = SecondChildViewController.instantiate()        
        let interactor = SecondChildInteractor(presenter: viewController)
        interactor.listener = listener
        return SecondChildRouter(interactor: interactor, viewController: viewController)
    }
}
