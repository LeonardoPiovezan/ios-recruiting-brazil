//
//  MoviesView.swift
//  Movs
//
//  Created by Leonardo Piovezan on 02/12/18.
//  Copyright © 2018 Leonardo Piovezan. All rights reserved.
//

import UIKit
import Moya

class MoviesView: UIViewController {

    let screen = MoviesScreen()

    private let service: MoviesService

    init(service: MoviesService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.service.getMoviesGenre().subscribe(onSuccess: { (result) in
            switch result {
            case .success(let genres):
                print(genres)
            case .error(let error):
                print(error)
            }
        })

    }
    
}
