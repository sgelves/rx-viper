//
//  PlacePlaceConfigurator.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlaceModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PlaceViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PlaceViewController) {

        let router = PlaceRouter()

        let presenter = PlacePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PlaceInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
