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

        self.movies = moviesSuccess.asDriver(onErrorJustReturn: [])

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
