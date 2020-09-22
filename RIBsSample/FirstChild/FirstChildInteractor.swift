//
//  FirstChildInteractor.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift

protocol FirstChildRouting: ViewableRouting {}

protocol FirstChildPresentable: Presentable {
    var listener: FirstChildPresentableListener? { get set }
}

protocol FirstChildListener: class {}

final class FirstChildInteractor: PresentableInteractor<FirstChildPresentable>, FirstChildInteractable, FirstChildPresentableListener {

    weak var router: FirstChildRouting?
    weak var listener: FirstChildListener?

    override init(presenter: FirstChildPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
}
