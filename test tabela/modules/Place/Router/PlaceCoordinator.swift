//
//  PlacePlaceRouter.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import UIKit

class PlaceCoordinator: PlaceCoordinatorInput {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PlaceViewController.instantiate()
        configure(viewController: vc)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showPlace(place: Local) {
        let vc = PlaceViewController.instantiate()
        configure(viewController: vc, place: place)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    private func configure(viewController: PlaceViewController, place: Local? = nil) {
        
        let router = self
        
        let presenter = PlacePresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = PlaceInteractor(place: place)
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }


}
