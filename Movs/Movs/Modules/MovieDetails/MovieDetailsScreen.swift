//
//  MovieDetailsScreen.swift
//  Movs
//
//  Created by Leonardo Piovezan on 07/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//
import UIKit

class MovieDetailsScreen: UIView, CodeView {

    lazy var scrollableView: ScrollableStackView = {
        return ScrollableStackView()
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 0
        return label
    }()

    lazy var genreLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 0
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 0
        return label
    }()

    lazy var yearLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        return label
    }()

    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.scrollableView)
        self.scrollableView.addArrangedSubview(self.imageView)
        self.scrollableView.addArrangedSubview(self.titleLabel)
        self.scrollableView.addArrangedSubview(self.yearLabel)
        self.scrollableView.addArrangedSubview(self.genreLabel)
        self.scrollableView.addArrangedSubview(self.descriptionLabel)
    }

    func setupConstraints() {
        self.scrollableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.bottom.equalToSuperview()
        }

        self.imageView.snp.makeConstraints { make in
            make.height.equalTo(self.snp.height).multipliedBy(0.35)
        }
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        self.scrollableView.stackView.spacing = 8
    }
}
