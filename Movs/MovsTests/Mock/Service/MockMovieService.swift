//
//  MockMovieService.swift
//  MovsTests
//
//  Created by Leonardo Piovezan on 12/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Foundation

@testable import Movs
import RxSwift

class MockMovieService: MoviesService {
    func getMoviesGenre() ->Single<Result<[Genre]>> {
        return Observable.of(Result.success([Genre]())).asSingle()
    }

    func getMovies(page: Int) ->  Single<Result<[Movie]>> {

        let firstMovie = Movie(id: 0,
                               title: "Filme1",
                               poster_path: nil,
                               genre_ids: [1, 2, 3],
                               release_date: "28-10-2018",
                               overview: "Descrição do Filme 1")

        let secondMovie = Movie(id: 0,
                               title: "Filme2",
                               poster_path: nil,
                               genre_ids: [1, 2, 3],
                               release_date: "28-10-2018",
                               overview: "Descrição do Filme 2")

        let movies = [firstMovie, secondMovie]
        return Observable.of(Result.success(movies)).asSingle()
    }
}
