//
//  ImageService.swift
//  Movs
//
//  Created by Leonardo Piovezan on 09/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//
import UIKit
import RxSwift

protocol ImageService {
    func getImageFor(path: String) -> Single<UIImage>
}
