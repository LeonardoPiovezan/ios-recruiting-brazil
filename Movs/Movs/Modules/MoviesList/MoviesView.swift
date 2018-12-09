//
//  MoviesView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
import Kingfisher
import RxKingfisher

protocol MoviesViewDelegate: class {
    func showDetailsOf(movie: Movie)
}

class MoviesView: UIViewController {

    let screen = MoviesScreen()

    var viewModel: MoviesViewModel!
    weak var delegate: MoviesViewDelegate?

    private let service: MoviesService
    private let disposeBag = DisposeBag()

    init(service: MoviesService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = screen
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Filmes do Poder"
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupBindings()
    }

    func setupViewModel() {
        self.viewModel = MoviesViewModel(service: self.service)
    }

    func setupBindings() {
        self.viewModel.movies
            .drive(self.screen
                .collectionView
                .rx.items(cellIdentifier: "Cell", cellType: MovieCollectionViewCell.self)) { _, movie, cell in
                cell.bind(movie: movie)
            }
            .disposed(by: self.disposeBag)

        self.screen.collectionView.rx.modelSelected(Movie.self)
            .asObservable()
            .subscribe(onNext: { [weak self] movie in
                self?.delegate?.showDetailsOf(movie: movie)
            }).disposed(by: self.disposeBag)

//        self.viewModel.movies
//            .drive(self.screen.tableView
//                .rx.items(cellIdentifier: "MoviesCell", cellType: UITableViewCell.self)) { _, element, cell in
//                    cell.textLabel?.text = element.title
//        }.disposed(by: self.disposeBag)
    }
}

extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}
