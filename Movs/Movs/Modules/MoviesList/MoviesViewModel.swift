//
//  MoviesViewModel.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import RxCocoa

class MoviesViewModel {

    let movies: Driver<[Movie]>
    private let moviesSuccess = PublishSubject<[Movie]>()
    private let disposeBag = DisposeBag()

    init(service: MoviesService) {

        let moviesResult = service.getMovies(page: 1)

        let movie = Movie(id: 0,
                          title: "Avengers",
                          poster_path: nil,
                          genre_ids: [1, 2, 3],
                          release_date: "28-10-2018",
                          overview: "Filme bacana")
        self.movies = moviesSuccess.asDriver(onErrorJustReturn: [movie])

        moviesResult
            .subscribe(onSuccess: { [weak self] result in
            switch result {
            case .success(let moviesArray):
                self?.moviesSuccess.onNext(moviesArray)
            case .error(let error):
                print(error)
            }
        }).disposed(by: disposeBag)
    }
}
