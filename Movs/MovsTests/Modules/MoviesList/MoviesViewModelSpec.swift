//
//  MoviesViewModelSpec.swift
//  MovsTests
//
//  Created by Leonardo Piovezan on 12/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import RxTest
import RxNimble

@testable import Movs
class MoviesViewModelSpec: QuickSpec {
    override func spec() {

        var subject: MoviesViewModel!
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!

        let imageService = MockImageService()
        let moviesService = MockMovieService()
        describe("Movie Details View Behaviour") {

            context("") {
                beforeEach {
                    disposeBag = DisposeBag()
                    scheduler = TestScheduler(initialClock: 0)
                    subject = MoviesViewModel(service: moviesService)
                }

                it ("Test Correct Title") {
                    let movies = scheduler.createObserver([Movie].self)

                    subject
                        .movies
                        .drive(movies)
                        .disposed(by: disposeBag)

                    let movie = Movie(id: 0,
                                      title: "Avengers",
                                      poster_path: nil,
                                      genre_ids: [1, 2, 3],
                                      release_date: "28-10-2018",
                                      overview: "Filme bacana")

                    scheduler.start()
                    let matcher = equal([.next(0, [movie]), .completed(0)])
                    expect(movies.events).to(matcher)
                }
            }
        }
    }
}
