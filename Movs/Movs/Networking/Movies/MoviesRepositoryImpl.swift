//
//  MoviesRepositoryImpl.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Moya
import RxSwift

class MoviesRepositoryImpl: MoviesRepository {

    let provider: MoyaProvider<MoviesRouter>
    init(provider: MoyaProvider<MoviesRouter>) {
        self.provider = provider
    }

    func getMoviesGenres() -> Single<Response> {
        return self.provider.rx.request(.getMoviesGenres)
    }

    func getMovies(page: Int) -> Single<Response> {
        return self.provider.rx.request(.getMovies(page: page))
    }
}
