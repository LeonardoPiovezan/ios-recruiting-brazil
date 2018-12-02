//
//  MoviesRepository.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//
import RxSwift
import Moya

protocol MoviesRepository {
    func getMoviesGenres() -> Single<Response>
    func getMovies(page: Int) -> Single<Response>
}
