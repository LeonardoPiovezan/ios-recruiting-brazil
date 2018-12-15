//
//  FavoriteMoviesViewModel.swift
//  Movs
//
//  Created by Leonardo Piovezan on 12/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import RxCocoa

class FavoriteMoviesViewModel {

    let movies: Driver<[Movie]>
    init() {

        let movie = Movie(id: 0,
                          title: "Avengers",
                          poster_path: nil,
                          genre_ids: [1, 2, 3],
                          release_date: "28-10-2018",
                          overview: "Filme bacana")

        self.movies = Driver.of([movie])

    }
}
