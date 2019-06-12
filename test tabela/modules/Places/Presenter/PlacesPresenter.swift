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
    var router: PlacesCoordinatorInput!

    func viewIsReady() {
        
    }
    
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String) {
        interactor.initialUserDataCollected(latitude: latitude, longitude: longitude, searchString: searchString)
        interactor.getNextPlacesPage()
    }
    
    func setNextPlacesPage(data: [Local]) {
        view.placesHasChanged(places: data)
    }
    
    func loadMoreData() {
        interactor.getNextPlacesPage()
    }
}
