//
//  Genre.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//
import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Hashable {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    var hashValue: Int {
        get {
            return id.hashValue
        }
    }

}
