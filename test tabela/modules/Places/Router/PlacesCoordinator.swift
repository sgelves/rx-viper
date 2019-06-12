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
    
    private func configure(viewController: PlacesViewController) {
        
        let router = PlacesCoordinator(navigationController: self.navigationController)
        
        let presenter = PlacesPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = PlacesInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        
    }
    
}
