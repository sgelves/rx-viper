//
//  PlacesPlacesPresenter.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

class PlacesPresenter: PlacesModuleInput, PlacesViewOutput, PlacesInteractorOutput {

    weak var view: PlacesViewInput!
    var interactor: PlacesInteractorInput!
    var router: PlacesRouterInput!

    func viewIsReady() {

    }
}
