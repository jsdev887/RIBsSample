//
//  FourthChildBuilder.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol FourthChildDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class FourthChildComponent: Component<FourthChildDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol FourthChildBuildable: Buildable {
    func build(withListener listener: FourthChildListener) -> FourthChildRouting
}

final class FourthChildBuilder: Builder<FourthChildDependency>, FourthChildBuildable {

    override init(dependency: FourthChildDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: FourthChildListener) -> FourthChildRouting {
        let component = FourthChildComponent(dependency: dependency)
        let viewController = FourthChildViewController()
        let interactor = FourthChildInteractor(presenter: viewController)
        interactor.listener = listener
        return FourthChildRouter(interactor: interactor, viewController: viewController)
    }
}
