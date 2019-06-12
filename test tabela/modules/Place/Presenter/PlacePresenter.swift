//
//  PlacePlacePresenter.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

class PlacePresenter: PlaceModuleInput, PlaceViewOutput, PlaceInteractorOutput {

    weak var view: PlaceViewInput!
    var interactor: PlaceInteractorInput!
    var router: PlaceRouterInput!

    func viewIsReady() {

    }
}
