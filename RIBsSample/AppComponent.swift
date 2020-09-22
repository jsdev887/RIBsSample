//
//  AppComponent.swift
//  RIBsSample
//
//  Created by Guri on 2020/09/14.
//  Copyright © 2020 Guri. All rights reserved.
//

import Foundation
import RIBs

class AppComponent: Component<EmptyDependency>, MainDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
