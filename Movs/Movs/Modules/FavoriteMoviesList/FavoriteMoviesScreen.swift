//
//  FavoriteMoviesScreen.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class FavoriteMoviesScreen: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoriteMoviesScreen: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.tableView)
    }

    func setupConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.leadingMargin.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }

    func setupAdditionalConfiguration() {
        self.tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesCell")
        self.backgroundColor = .white

    }
}
