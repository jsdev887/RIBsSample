//
//  SubBuilder.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol FirstChildDependency: Dependency {}

final class FirstChildComponent: Component<FirstChildDependency> {}

// MARK: - Builder

protocol FirstChildBuildable: Buildable {
    func build(withListener listener: FirstChildListener) -> FirstChildRouting
}

final class FirstChildBuilder: Builder<FirstChildDependency>, FirstChildBuildable {

    override init(dependency: FirstChildDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: FirstChildListener) -> FirstChildRouting {
        let component = FirstChildComponent(dependency: dependency)
        let viewController = FirstChildViewController.instantiate()
        let interactor = FirstChildInteractor(presenter: viewController)
        interactor.listener = listener
        return FirstChildRouter(interactor: interactor, viewController: viewController)
    }
}
