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

    init(window: UIWindow,
         container: Container) {
        self.window = window
        self.container = container
    }
    
    func start() {
        let splashView = container.resolve(SplashView.self)!
        window.rootViewController = splashView
    }
}
