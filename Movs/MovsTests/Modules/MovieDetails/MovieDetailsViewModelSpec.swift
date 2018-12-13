//
//  MovieDetailsViewModelSpec.swift
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
class MovieDetailsViewModelSpec: QuickSpec {
    override func spec() {

        var subject: MovieDetailsViewModel!
        var scheduler: TestScheduler!
        var disposeBag: DisposeBag!

        let imageService = MockImageService()
        let moviesService = MockMovieService()
        describe("Movie Details View Behaviour") {

            context("") {
                beforeEach {
                    disposeBag = DisposeBag()
                    scheduler = TestScheduler(initialClock: 0)
                    let movie = Movie(id: 0,
                                      title: "Avengers",
                                      poster_path: nil,
                                      genre_ids: [1, 2, 3],
                                      release_date: "28-10-2018",
                                      overview: "Filme bacana")
                    subject = MovieDetailsViewModel(movie: movie,
                                                    imageService: imageService,
                                                    moviesService: moviesService)
                }

                it ("Test Correct Title") {

                    let title = scheduler.createObserver(String.self)
                    subject
                        .title
                        .drive(title)
                        .disposed(by: disposeBag)

                    scheduler.start()
                    expect(title.events).to(equal([
                        .next(0, "Avengers"),
                        .completed(0)
                        ]))
                }

                it("Test Correct Overview") {
                    let overview = scheduler.createObserver(String.self)
                    subject
                        .overview
                        .drive(overview)
                        .disposed(by: disposeBag)

                    scheduler.start()
                    expect(overview.events).to(equal([
                        .next(0, "Filme bacana"),
                        .completed(0)
                        ]))
                }

                it("Test Correct Date") {
                    let date = scheduler.createObserver(String.self)
                    subject
                        .date
                        .drive(date)
                        .disposed(by: disposeBag)

                    scheduler.start()
                    expect(date.events).to(equal([
                        .next(0, "28-10-2018"),
                        .completed(0)
                        ]))
                }
            }
        }
    }
}
