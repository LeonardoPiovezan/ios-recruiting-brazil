//
//  DefaultContainer+Views.swift
//  Movs
//
//  Created by Leonardo Piovezan on 01/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

extension DefaultContainer {
    func registerViews() {
        self.container.register(SplashView.self) { _ in
            SplashView()
        }
        
        self.container.register(MoviesView.self) { _ in
            return MoviesView()
        }
        
        self.container.register(FavoriteMoviesView.self) { _ in
            return FavoriteMoviesView()
        }
    }
}
