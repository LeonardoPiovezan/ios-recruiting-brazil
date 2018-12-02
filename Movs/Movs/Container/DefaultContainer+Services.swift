//
//  DefaultContainer+Services.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation

extension DefaultContainer {
    func registerServices() {
        self.container.register(MoviesService.self) { resolver in
            let repository = resolver.resolve(MoviesRepository.self)!
            return MoviesServiceImpl(repository: repository)
        }
    }
}
