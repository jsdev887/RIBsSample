//
//  DataStream.swift
//  RIBsSample
//
//  Created by Jiwoo on 2020/09/24.
//  Copyright © 2020 Guri. All rights reserved.
//

import RxSwift
import RxCocoa

struct Message {
    let currentMessage: String
}

protocol MessageStream: class {
    var message: Observable<Message> { get }
}

protocol MutableMessageStream: MessageStream {
    func passMessage(newMessage message: String)
}

class MessageStreamImpl: MutableMessageStream {

    var message: Observable<Message> {
        return variable
            .asObservable()
    }
    
    func passMessage(newMessage message: String) {
        let newMessage = Message(currentMessage: message)
        variable.accept(newMessage)
    }
    
    // MARK: - Private

    private let variable = BehaviorRelay<Message>(value: Message(currentMessage: ""))
}
