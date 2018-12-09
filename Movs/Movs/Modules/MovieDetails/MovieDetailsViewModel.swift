//
//  MovieDetailsViewModel.swift
//  Movs
//
//  Created by Leonardo Piovezan on 07/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import RxCocoa

final class MovieDetailsViewModel {

    let title: Driver<String>
    let image: Driver<UIImage>
    let overview: Driver<String>
    let genres: Driver<String>
    let date: Driver<String>

    init(movie: Movie, imageService: ImageService) {

        let movieObservable = Observable.of(movie).share()

        self.image = movieObservable.flatMapLatest { movie in
            return  imageService.getImageFor(path: movie.poster_path ?? "")
            }.asDriver(onErrorJustReturn: UIImage())

        self.title = movieObservable.map { $0.title }
            .asDriver(onErrorJustReturn: "")

        self.overview = movieObservable.map { $0.overview }
            .asDriver(onErrorJustReturn: "")

        self.genres = movieObservable.map { $0.genre_ids.map { String($0)}.reduce("", +) }
            .asDriver(onErrorJustReturn: "")
        self.date = movieObservable.map { $0.release_date }
            .asDriver(onErrorJustReturn: "")
    }
}
