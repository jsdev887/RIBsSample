//
//  MainInteractor.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    func routeToFirstChild()
    func routeToSecondChild()
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
}

protocol MainListener: class {}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {
    
    weak var router: MainRouting?
    weak var listener: MainListener?

    override init(presenter: MainPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    func tapShowFirstChildButton() {
        print("PushViewController - 2. RouteToFirstChild")
        router?.routeToFirstChild()
    }
    
    func tapShowSecondChildButton() {
        print("PresentViewController - 2. RouteToSecondChild")
        router?.routeToSecondChild()
    }

}
