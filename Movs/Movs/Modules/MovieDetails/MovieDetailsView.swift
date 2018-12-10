//
//  MovieDetailsView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 07/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import RxSwift

final class MovieDetailsView: UIViewController {

    let screen = MovieDetailsScreen()
    var movie: Movie!
    var viewModel: MovieDetailsViewModel!

    private let imageService: ImageService
    private let moviesService: MoviesService

    private let disposeBag = DisposeBag()
    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen.titleLabel.text = movie.title
        self.title = movie.title
        self.setupViewModel()
        self.setupBindings()
    }

    init(imageService: ImageService, moviesService: MoviesService) {
        self.imageService = imageService
        self.moviesService = moviesService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViewModel() {
        self.viewModel = MovieDetailsViewModel(movie: self.movie,
                                               imageService: self.imageService,
                                               moviesService: self.moviesService)
    }

    func setupBindings() {
        self.viewModel.image
            .drive(self.screen.imageView.rx.image)
            .disposed(by: self.disposeBag)

        self.viewModel.title
            .drive(self.screen.titleLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel.overview
            .drive(self.screen.descriptionLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel.genres
            .drive(self.screen.genreLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel.date
            .drive(self.screen.yearLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
