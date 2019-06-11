//
//  PlacesPlacesConfigurator.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlacesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PlacesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PlacesViewController) {

        let router = PlacesRouter()

        let presenter = PlacesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PlacesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
