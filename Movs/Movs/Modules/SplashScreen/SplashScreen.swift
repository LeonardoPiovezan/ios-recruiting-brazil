//
//  SplashScene.swift
//  Movs
//
//  Created by Leonardo Piovezan on 01/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import SnapKit

class SplashScreen: UIView {

    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .movsYellow
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 50)
        label.textColor = .movsDarkPurple
        return label
    }()

}

extension SplashScreen: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.title)
    }

    func setupConstraints() {
        self.title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        self.title.text = "Movs"
    }
}
