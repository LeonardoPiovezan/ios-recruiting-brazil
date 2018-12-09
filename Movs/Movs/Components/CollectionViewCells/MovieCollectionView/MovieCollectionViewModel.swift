//
//  MovieCollectionViewModel.swift
//  Movs
//
//  Created by Leonardo Piovezan on 08/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import RxCocoa
import Kingfisher

class MovieCollectionViewModel {
    let title: Driver<String>
    let image: Driver<UIImage>

    private let movieSubject = PublishSubject<Movie>()

    init() {

        let downloader = KingFisherService()

        self.title = movieSubject.map { $0.title }
            .asDriver(onErrorJustReturn: "")

        self.image = movieSubject
            .flatMapLatest { movie in
                return downloader.getImageFor(path: movie.poster_path ?? "")
            }.asDriver(onErrorJustReturn: UIImage())
    }

    func bind(movie: Movie) {
        movieSubject.onNext(movie)
    }
}
