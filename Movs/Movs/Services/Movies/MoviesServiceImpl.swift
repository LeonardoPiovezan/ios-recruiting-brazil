//
//  MoviesServiceImpl.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import RxSwift
import Moya

enum Result<T> {
    case success(T)
    case error(error: Error)
}

struct MoviesError: LocalizedError {
    let message: String

    init(message: String) {
        self.message = message
    }

    var errorDescription: String? {
        return self.message
    }
}
final class MoviesServiceImpl: MoviesService {
    private let repository: MoviesRepository

    init(repository: MoviesRepository) {
        self.repository = repository
    }

    func getMoviesGenre() -> Single<Result<[Genre]>> {
        return self.repository.getMoviesGenres()
            .map { response in

                if response.statusCode == 200 {
                    do {
                        let genreResponse: GenreResponse = try response.map(GenreResponse.self)
                        return Result.success(genreResponse.genres)

                    } catch let error {
                        return Result.error(error: error)
                    }
                }
                
                let error = MoviesError(message: "Request Failed with code: \(response.statusCode)")
                return Result.error(error: error)
            }

    }

    func getMovies(page: Int) -> Single<Result<[Movie]>> {
        return self.repository.getMovies(page: page)
            .map { response in
                if response.statusCode == 200 {
                    do {
                        let moviesResponse: MoviesResponse = try response.map(MoviesResponse.self)
                        return Result.success(moviesResponse.results)
                    } catch let error {
                        return Result.error(error: error)
                    }
                }

                let error = MoviesError(message: "Request Failed with code: \(response.statusCode)")
                return Result.error(error: error)
        }
    }

}
