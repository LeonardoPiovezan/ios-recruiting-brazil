//
//  KingFisherService.swift
//  Movs
//
//  Created by Leonardo Piovezan on 09/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//
import UIKit
import Kingfisher
import RxSwift

class KingFisherService: ImageService {

    func getImageFor(path: String) -> Single<UIImage> {

        let urlString = Constants.Network.baseImageURL + path + "?api_key=\(Constants.APIKey.tmdb)"

        guard let url = URL(string: urlString) else {
            return Single<UIImage>.create { single in
                single(.success(UIImage()))
                return Disposables.create {}
            }
        }
        return KingfisherManager.shared.rx.retrieveImage(with: url)
    }

}
