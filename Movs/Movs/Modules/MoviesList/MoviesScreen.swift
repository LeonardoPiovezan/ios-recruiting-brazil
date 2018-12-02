//
//  MoviesScreen.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class MoviesScreen: UIView {

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

    }

    func setupConstraints() {

    }

    func setupAdditionalConfiguration() {

    }
}
