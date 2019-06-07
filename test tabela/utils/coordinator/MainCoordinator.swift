//
//  MainCoordinator.swift
//  test tabela
//
//  Created by Sergio Gelves on 6/7/19.
//  Copyright © 2019 sgelves. All rights reserved.
//
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ResultsViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}
