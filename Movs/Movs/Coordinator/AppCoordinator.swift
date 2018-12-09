//
//  AppCoordinator.swift
//  Movs
//
//  Created by Leonardo Piovezan on 01/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//
import UIKit
import Swinject

final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private let container: Container

    private let tabBarView: UITabBarController

    private var navigationController: UINavigationController!
    init(window: UIWindow,
         container: Container) {
        self.window = window
        self.container = container
        self.tabBarView = UITabBarController(nibName: nil, bundle: nil)
    }
    
    func start() {
//        let splashView = container.resolve(SplashView.self)!
//        window.rootViewController = splashView

        let moviesView = self.container.resolve(MoviesView.self)!
        moviesView.delegate = self
        let favoriteMoviesView = self.container.resolve(FavoriteMoviesView.self)!
        moviesView.tabBarItem = UITabBarItem(title: "Filmes", image: nil, tag: 0)
        favoriteMoviesView.tabBarItem = UITabBarItem(title: "Favoritos", image: nil, tag: 0)

        self.navigationController = UINavigationController(rootViewController: moviesView)
        tabBarView.viewControllers = [self.navigationController,
                                      favoriteMoviesView]

        window.rootViewController = self.tabBarView
    }
}

extension AppCoordinator: MoviesViewDelegate {
    func showDetailsOf(movie: Movie) {
        let movieDetailsView = self.container.resolve(MovieDetailsView.self)!
        movieDetailsView.movie = movie
        self.navigationController.pushViewController(movieDetailsView, animated: true)
    }
}
