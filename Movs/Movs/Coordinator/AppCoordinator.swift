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

    init(window: UIWindow,
         container: Container) {
        self.window = window
        self.container = container
        self.tabBarView = UITabBarController(nibName: nil, bundle: nil)
    }
    
    func start() {
//        let splashView = container.resolve(SplashView.self)!
//        window.rootViewController = splashView

        let moviesView = container.resolve(MoviesView.self)!
        let favoriteMoviesView = container.resolve(FavoriteMoviesView.self)!
        moviesView.tabBarItem = UITabBarItem(title: "Filmes", image: nil, tag: 0)
        favoriteMoviesView.tabBarItem = UITabBarItem(title: "Favoritos", image: nil, tag: 0)

        let navigationController = UINavigationController(rootViewController: moviesView)
        tabBarView.viewControllers = [navigationController, favoriteMoviesView]

        window.rootViewController = self.tabBarView
    }
}
