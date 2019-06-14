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
    
    var input: PreseToInterPlacesProtocol
    
    fileprivate let dispose = DisposeBag()
    
    // Observable Interactor initialization
    var placesBehaviorSubject: BehaviorSubject<[Local]>
    
    init (input: PreseToInterPlacesProtocol) {
        
        self.placesBehaviorSubject = BehaviorSubject<[Local]>(value: resultData)
        self.input = input
        super.init()
        
        // subscribe to input listeners
        self.input.userRequestedPlacesPage.subscribe({ event in
            self.getNextPage {
                // Emit data back
                self.placesBehaviorSubject.on(.next(self.resultData))
            }
        }).disposed(by: dispose)
        
        self.input.userResetInitialData.subscribe({ event in
            if (event.element != nil) {
                
                self.startLocaisState(latitude: event.element?["latitude"] as! Double,
                                      longitude: event.element?["longitude"] as! Double,
                                      searchString: event.element?["searchString"] as! String )
                
            }
        }).disposed(by: dispose)
    }
}
