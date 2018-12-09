//
//  MoviesScreen.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class MoviesScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical
        let width = UIScreen.main.bounds.width/2 - 13
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 10
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .gray
        return collection
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
        self.addSubview(collectionView)
    }

    func setupConstraints() {

        self.collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }

    func setupAdditionalConfiguration() {
     self.collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
}
