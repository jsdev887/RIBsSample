//
//  MainBuilder.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs

protocol MainDependency: Dependency {}

final class MainComponent: Component<MainDependency> {}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = UIStoryboard(
                   name: "Main",
                   bundle: nil
               ).instantiateViewController(
                   withIdentifier: "MainViewController"
               ) as! MainViewController
        
        let interactor = MainInteractor(presenter: viewController)
        
        let firstBuilder = FirstChildBuilder(dependency: component)
        let secondBuilder = SecondChildBuilder(dependency: component)

        return MainRouter(interactor: interactor,
                          viewController: viewController,
                          firstBuildable: firstBuilder,
                          secondBuildable: secondBuilder)
    }
    
}