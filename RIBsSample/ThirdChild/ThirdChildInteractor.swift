//
//  ThirdChildInteractor.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RIBs
import RxSwift

protocol ThirdChildRouting: ViewableRouting {
}

protocol ThirdChildPresentable: Presentable {
    var listener: ThirdChildPresentableListener? { get set }
    func setMessage(newMessage: Message)
}

protocol ThirdChildListener: class {
}

final class ThirdChildInteractor: PresentableInteractor<ThirdChildPresentable>, ThirdChildInteractable, ThirdChildPresentableListener {

    weak var router: ThirdChildRouting?
    weak var listener: ThirdChildListener?

    init(presenter: ThirdChildPresentable,
         messageStream: MessageStream) {
        
        self.messageStream = messageStream
        
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        bindStream()
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    // MARK: - Private
    
    private let messageStream: MessageStream
    
    private func bindStream() {
        messageStream.message
            .subscribe(
                onNext: { (message: Message) in
                    self.presenter.setMessage(newMessage: message)
                }
            ).disposeOnDeactivate(interactor: self)
    }
    
}
