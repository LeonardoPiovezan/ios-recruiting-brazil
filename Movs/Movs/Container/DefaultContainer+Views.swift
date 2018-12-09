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
        
        self.container.register(MoviesView.self) { resolver in

            let service = resolver.resolve(MoviesService.self)!
            return MoviesView(service: service)
        }
        
        self.container.register(FavoriteMoviesView.self) { _ in
            return FavoriteMoviesView()
        }

        self.container.register(MovieDetailsView.self) { resolver in
            let service = resolver.resolve(ImageService.self)!
            return MovieDetailsView(imageService: service)
        }
    }
}
