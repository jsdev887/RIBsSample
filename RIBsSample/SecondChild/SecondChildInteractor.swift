//
//  SecondChildInteractor.swift
//  RIBsSample
//
//  Created by Guri  on 2020/09/15.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift

protocol SecondChildRouting: ViewableRouting {}

protocol SecondChildPresentable: Presentable {
    var listener: SecondChildPresentableListener? { get set }
}

protocol SecondChildListener: class {}

final class SecondChildInteractor: PresentableInteractor<SecondChildPresentable>, SecondChildInteractable, SecondChildPresentableListener {

    weak var router: SecondChildRouting?
    weak var listener: SecondChildListener?

    override init(presenter: SecondChildPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
}
