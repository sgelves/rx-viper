//
//  Coordinator.swift
//  test tabela
//
//  Created by Sergio Gelves on 6/6/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start ()
}
