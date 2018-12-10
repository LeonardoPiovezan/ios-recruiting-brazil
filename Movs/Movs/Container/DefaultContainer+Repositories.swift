//
//  DefaultContainer+Repositories.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Moya
extension DefaultContainer {

    func registerRepositories() {
        self.container.register(MoviesRepository.self) { _ in
            let provider = MoyaProvider<MoviesRouter>(plugins: self.getDefaultPlugins())
            return MoviesRepositoryImpl(provider: provider)
        }
    }

    func getDefaultPlugins() -> [PluginType] {
        return [NetworkLoggerPlugin(verbose: false)]
    }
}
