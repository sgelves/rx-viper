//
//  PlacesPlacesPresenter.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import RxSwift

class PlacesPresenter: NSObject, PlacesModuleInput, PlacesViewOutput, PreseToInterPlacesProtocol {

    weak var view: PlacesViewInput!
    var interactor: InterToPresePlacesProtocol!
    var router: PlacesCoordinatorInput!
    
    // Observables aimed to interactor
    var userResetInitialData: PublishSubject<Dictionary<String, Any>>
    var userRequestedPlacesPage: PublishSubject<Bool>
    
    let dispose = DisposeBag()
    
    override init () {
        //initialize observables
        userResetInitialData = PublishSubject<Dictionary>()
        userRequestedPlacesPage = PublishSubject<Bool>()
        super.init()
    }

    func viewIsReady() {
        // create observers
        interactor.placesBehaviorSubject.subscribe({ event in //Sub A added and most recent event replayed ("starting value")
            if event.element != nil {
                self.view.placesHasChanged(places: event.element!)
            }
        }).disposed(by: self.dispose)
    }
    
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String) {
        
        self.userResetInitialData.on(.next([
            "latitude": latitude, "longitude": longitude, "searchString": searchString
            ]))
        self.userRequestedPlacesPage.on(.next(true))
    }
    
    // TODO deletar
    func setNextPlacesPage(data: [Local]) {
    }
    
    func loadMoreData() {
        self.userRequestedPlacesPage.on(.next(true))
    }
    
    func userSelectedPlace(place: Local) {
        router.showNext(place: place)
    }
    
    func viewDidFinish() {
        router.childDidFinish()
    }
}
