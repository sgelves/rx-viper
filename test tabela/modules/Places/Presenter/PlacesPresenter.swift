//
//  PlacesPlacesPresenter.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import RxSwift

class PlacesPresenter: NSObject, PlacesModuleInput, PreseToInterPlacesProtocol, PreseToViewPlacesProtocol {

    var view: ViewToPresePlacesProtocol!
    var interactor: InterToPresePlacesProtocol!
    var router: PlacesCoordinatorInput!
    
    // Observable to view
    var placesDataChanged = PublishSubject<[Local]>()
    
    // Observables aimed to interactor
    var userResetInitialData: PublishSubject<Dictionary<String, Any>>
    var userRequestedPlacesPage: PublishSubject<Bool>
    
    let dispose = DisposeBag()
    
    init (view: ViewToPresePlacesProtocol) {
        //initialize observables
        userResetInitialData = PublishSubject<Dictionary>()
        userRequestedPlacesPage = PublishSubject<Bool>()
        
        super.init()
        
        self.view = view
        self.view.uiviewDidLoad.subscribe({ event in
             self.connect()
        }).disposed(by: dispose)
    }

    fileprivate func connect() {
        // create observers
        self.view.loadMoreResultData.subscribe({ event in
            self.userRequestedPlacesPage.on(.next(true))
        }).disposed(by: dispose)
        
        self.view.selectedPlace.subscribe({ event in
            if (event.element != nil) {
                self.router.showNext(place: event.element!)
            }
        }).disposed(by: dispose)
        
        self.view.resetResultData.subscribe({ event in
            guard event.element != nil else {
                return
            }
            
            let data: Dictionary = event.element!
            
            self.userResetInitialData.on(.next([
                "latitude": data["latitude"] as! Double,
                "longitude": data["longitude"] as! Double,
                "searchString": data["searchString"] as! String
                ]))
            
            self.userRequestedPlacesPage.on(.next(true))
            
        }).disposed(by: dispose)
        
        self.view.uiviewDidFinish.subscribe({ event in
            self.router.childDidFinish()
        }).disposed(by: dispose)
        
        self.interactor.placesBehaviorSubject.subscribe({ event in //Sub A added and most recent event replayed ("starting value")
            if event.element != nil {
                self.placesDataChanged.on(.next(event.element!))
            }
        }).disposed(by: self.dispose)
    }
}
