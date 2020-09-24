//
//  ThirdChildBuilder.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol ThirdChildDependency: Dependency {
    var messageStream: MessageStream { get }
}

final class ThirdChildComponent: Component<ThirdChildDependency> {
    fileprivate var messageStream: MessageStream {
        return dependency.messageStream
    }
}

// MARK: - Builder

protocol ThirdChildBuildable: Buildable {
    func build(withListener listener: ThirdChildListener) -> ThirdChildRouting
}

final class ThirdChildBuilder: Builder<ThirdChildDependency>, ThirdChildBuildable {
    
    override init(dependency: ThirdChildDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: ThirdChildListener) -> ThirdChildRouting {
        let component = ThirdChildComponent(dependency: dependency)
        let viewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: "ThirdChildViewController"
        ) as! ThirdChildViewController
        
        let interactor = ThirdChildInteractor(presenter: viewController,
                                              messageStream: component.messageStream)
        interactor.listener = listener
        return ThirdChildRouter(interactor: interactor, viewController: viewController)
    }
}
