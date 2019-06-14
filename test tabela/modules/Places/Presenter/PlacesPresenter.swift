//
//  PlacesPlacesPresenter.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import RxSwift

class PlacesPresenter: PlacesModuleInput, PlacesViewOutput {

    weak var view: PlacesViewInput!
    var interactor: PlacesInteractorInput!
    var router: PlacesCoordinatorInput!
    
    let dispose = DisposeBag()

    func viewIsReady() {
        interactor.placesBehaviorSubject.subscribe({ event in //Sub A added and most recent event replayed ("starting value")
            if event.element != nil {
                self.view.placesHasChanged(places: event.element!)
            }
        }).disposed(by: self.dispose)
    }
    
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String) {
        interactor.initialUserDataCollected(latitude: latitude, longitude: longitude, searchString: searchString)
        interactor.getNextPlacesPage()
    }
    
    // TODO deletar
    func setNextPlacesPage(data: [Local]) {
    }
    
    func loadMoreData() {
        interactor.getNextPlacesPage()
    }
    
    func userSelectedPlace(place: Local) {
        router.showNext(place: place)
    }
    
    func viewDidFinish() {
        router.childDidFinish()
    }
}
