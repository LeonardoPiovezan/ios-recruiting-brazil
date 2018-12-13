//
//  MockImageService.swift
//  MovsTests
//
//  Created by Leonardo Piovezan on 12/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

@testable import Movs
import RxSwift

class MockImageService: ImageService {
    func getImageFor(path: String) -> Single<UIImage> {
        return Observable.of(UIImage()).asSingle()
    }
}
