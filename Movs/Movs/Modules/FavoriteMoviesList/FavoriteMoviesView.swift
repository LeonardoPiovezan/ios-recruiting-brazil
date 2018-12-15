//
//  FavoriteMoviesView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import RxSwift

class FavoriteMoviesView: UIViewController {

    private let screen = FavoriteMoviesScreen()
    private var viewModel: FavoriteMoviesViewModel!
    private let disposeBag = DisposeBag()

    override func loadView() {
        self.view = screen
        self.title = "Favoritos"
        self.navigationController?.navigationBar.barTintColor = .movsYellow
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupBindings()
    }

    func setupViewModel() {
        self.viewModel = FavoriteMoviesViewModel()
    }
    
    func setupBindings() {
        self.viewModel.movies
            .drive(self.screen.tableView
                .rx.items(cellIdentifier: "MoviesCell", cellType: MoviesTableViewCell.self)) { _, element, cell in
                    cell.textLabel?.text = element.title
            }.disposed(by: self.disposeBag)
    }
    
}
