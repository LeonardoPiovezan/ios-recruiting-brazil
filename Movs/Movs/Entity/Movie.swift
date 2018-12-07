//
//  Movie.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

struct MoviesResponse: Codable {

    let page: Int
    let results: [Movie]
}
struct Movie: Codable {

    let id: Int
    let title: String
    let poster_path: String?
}
