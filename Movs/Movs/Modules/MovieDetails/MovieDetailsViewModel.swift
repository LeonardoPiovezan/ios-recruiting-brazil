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

    private let genreSubject = PublishSubject<[Genre]>()
    private let disposeBag = DisposeBag()

    init(movie: Movie,
         imageService: ImageService,
         moviesService: MoviesService) {

        let movieObservable = Observable.of(movie).share()
        let genresObservable = movieObservable.map { $0.genre_ids }

        self.image = movieObservable.flatMapLatest { movie in
            return  imageService.getImageFor(path: movie.poster_path ?? "")
            }.asDriver(onErrorJustReturn: UIImage())

        self.title = movieObservable.map { $0.title }
            .asDriver(onErrorJustReturn: "")

        self.overview = movieObservable.map { $0.overview }
            .asDriver(onErrorJustReturn: "")

        self.genres = genreSubject
            .asObservable()
            .withLatestFrom(genresObservable) { array, ids in
                return ids.flatMap { id in
                    return array.filter { $0.id == id }
                        .map { $0.name }
                    }.reduce("", { previous, next in
                        return (previous + next + " ")
                    })
            }
            .asDriver(onErrorJustReturn: "")

        self.date = movieObservable.map { $0.release_date }
            .asDriver(onErrorJustReturn: "")

        moviesService.getMoviesGenre()
            .subscribe(onSuccess: { [weak self] result in
            switch result {
            case .success(let genreArray):
                self?.genreSubject.onNext(genreArray)
            case .error(let error):
                print(error.localizedDescription)
            }
        }).disposed(by: disposeBag)
    }
}
