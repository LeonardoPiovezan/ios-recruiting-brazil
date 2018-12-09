//
//  ScrollableStackView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 07/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class ScrollableStackView: UIView, CodeView {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.axis = .vertical
        return stackView
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect.zero)
        return scrollView
    }()

    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
    }

    func setupConstraints() {
        self.scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
    
    }

    func addArrangedSubview(_ view: UIView) {
        self.stackView.addArrangedSubview(view)
    }

}
