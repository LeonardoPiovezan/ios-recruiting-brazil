//
//  MovieDescriptionView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 13/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class MovieDescriptionView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 0
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 0
        return label
    }()

    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieDescriptionView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.descriptionLabel)
    }

    func setupConstraints() {

        self.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(16)
        }

        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(16)
        }
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = .gray
    }


}
