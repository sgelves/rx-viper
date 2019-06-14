//
//  PlacesCoordinator.swift
//  test tabela
//
//  Created by Sergio Gelves on 6/11/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import UIKit

class PlacesCoordinator: PlacesCoordinatorInput {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PlacesViewController.instantiate()
        configure(viewController: vc)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func showNext(place: Local) {
        parentCoordinator?.showPlace(place: place)
    }
    
    private func configure(viewController: PlacesViewController) {
        
        let router = self
        
        let presenter = PlacesPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = PlacesInteractor(input: presenter)
        
        presenter.interactor = interactor
        viewController.output = presenter
        
    }
    
}
