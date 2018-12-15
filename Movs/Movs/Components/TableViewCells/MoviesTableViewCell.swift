//
//  MoviesTableViewCell.swift
//  Movs
//
//  Created by Leonardo Piovezan on 03/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    lazy var descriptionView: MovieDescriptionView = {
        let view = MovieDescriptionView()
        view.backgroundColor = .movsLightGray
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
}

extension MoviesTableViewCell: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.movieImageView)
        self.addSubview(self.descriptionView)
    }

    func setupConstraints() {
        self.movieImageView.snp.makeConstraints({ make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        })

        self.descriptionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(self.movieImageView.snp.right)
            make.right.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        self.movieImageView.image = UIImage(named: "movie")
        self.descriptionView.titleLabel.text = "Natuto"
        self.descriptionView.descriptionLabel.text = "Adoro narutinho do meu coracao mais texo"
    }

}
