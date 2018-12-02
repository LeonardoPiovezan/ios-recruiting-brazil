//
//  DefaultContainer.swift
//  Movs
//
//  Created by Leonardo Piovezan on 01/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation
import Swinject

final class DefaultContainer {

    let container: Container

    init() {
        self.container = Container()
        self.registerViews()
    }
}

