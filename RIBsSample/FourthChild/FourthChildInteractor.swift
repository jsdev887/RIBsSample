//
//  FourthChildInteractor.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift

protocol FourthChildRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol FourthChildPresentable: Presentable {
    var listener: FourthChildPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FourthChildListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FourthChildInteractor: PresentableInteractor<FourthChildPresentable>, FourthChildInteractable, FourthChildPresentableListener {

    weak var router: FourthChildRouting?
    weak var listener: FourthChildListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FourthChildPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
