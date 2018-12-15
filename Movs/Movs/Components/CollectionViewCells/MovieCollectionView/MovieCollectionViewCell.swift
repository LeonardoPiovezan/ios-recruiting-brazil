//
//  MovieCollectionViewCell.swift
//  Movs
//
//  Created by Leonardo Piovezan on 08/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import RxSwift

final class MovieCollectionViewCell: UICollectionViewCell {
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .movsYellow
        return label
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    var viewModel: MovieCollectionViewModel!

    var disposeBag = DisposeBag()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupViewModel()
        self.setupBindings()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViewModel() {
        self.viewModel = MovieCollectionViewModel()
    }

    func setupBindings() {
        self.viewModel.title
            .drive(self.textLabel.rx.text)
            .disposed(by: self.disposeBag)

        self.viewModel.image
            .drive(self.imageView.rx.image)
            .disposed(by: self.disposeBag)

    }

    func bind(movie: Movie) {
        self.viewModel.bind(movie: movie)
    }

}

extension MovieCollectionViewCell: CodeView {

    func buildViewHierarchy() {
        self.addSubview(self.imageView)
        self.addSubview(self.textLabel)
    }

    func setupConstraints() {
        self.imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }

        self.textLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = .movsDarkPurple
    }
}
