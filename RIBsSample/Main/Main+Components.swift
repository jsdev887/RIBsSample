//
//  Main+Components.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import Foundation
import RIBs

extension MainComponent: FirstChildDependency {
}

extension MainComponent: SecondChildDependency {
}

extension MainComponent: ThirdChildDependency {
    var messageStream: MessageStream {
        return mutableMeesageStream
    }
}

extension MainComponent: FourthChildDependency {
}
