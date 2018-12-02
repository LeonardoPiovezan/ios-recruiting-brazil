//
//  MoviesView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit

class MoviesView: UIViewController {

    let screen = MoviesScreen()

    override func loadView() {
        self.view = screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
