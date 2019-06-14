//
//  PlacesPlacesInteractor.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import RxSwift

class PlacesInteractor: NSObject, InterToPresePlacesProtocol, InfinitePlacesListModel {
    
    var resultData: [Local] = []
    var currentPage: Int = 0
    var isFetchingPlaces: Bool = false

    var searchString: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var interactor: PreseToInterPlacesProtocol
    
    fileprivate let dispose = DisposeBag()
    
    // Observable Interactor initialization
    var placesBehaviorSubject: PublishSubject<[Local]>
    
    init (input: PreseToInterPlacesProtocol) {
        
        self.placesBehaviorSubject = PublishSubject<[Local]>()
        self.interactor = input
        super.init()
        
        // subscribe to input listeners
        self.interactor.userRequestedPlacesPage.subscribe({ event in
            self.getNextPage {
                // Emit data back
                self.placesBehaviorSubject.on(.next(self.resultData))
            }
        }).disposed(by: dispose)
        
        self.interactor.userResetInitialData.subscribe({ event in
            if (event.element != nil) {
                
                self.startLocaisState(latitude: event.element?["latitude"] as! Double,
                                      longitude: event.element?["longitude"] as! Double,
                                      searchString: event.element?["searchString"] as! String )
                
            }
        }).disposed(by: dispose)
    }
}
