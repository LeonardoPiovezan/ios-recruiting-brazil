//
//  MoviesRouter.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import Moya

enum MoviesRouter {
    case getMovies(page: Int)
    case getMoviesGenres
}

extension MoviesRouter: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }

    var path: String {
        switch self {
        case .getMovies:
            return "/movie/popular"
        case .getMoviesGenres:
            return "genre/movie/list"
        }
    }

    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getMovies:
            return Task.requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
        case .getMoviesGenres:
            return Task.requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
        }

    }

    var headers: [String : String]? {
        return nil
    }
    var parameters: [String: Any]? {
        switch self {
        case .getMovies(let page):
            return ["api_key": "1177a031b21e49e0ee7d6b61864d7209",
                    "language": "en-US",
                    "page": page]
        case .getMoviesGenres:
            return ["api_key": "1177a031b21e49e0ee7d6b61864d7209",
                    "language": "en-US"]
        }
    }
}
