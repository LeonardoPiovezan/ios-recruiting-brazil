//
//  CodeView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 01/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
