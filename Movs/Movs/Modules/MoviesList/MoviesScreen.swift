//
//  MoviesScreen.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class MoviesScreen: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.backgroundColor = .gray
        return tableView
    }()

    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = . movsDarkPurple
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoviesScreen: CodeView {
    func buildViewHierarchy() {
        self.addSubview(tableView)
    }

    func setupConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.leadingMargin.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        
    }
}
