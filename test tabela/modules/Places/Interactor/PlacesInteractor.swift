//
//  PlacesPlacesInteractor.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import RxSwift

class PlacesInteractor: NSObject, PlacesInteractorInput, InfinitePlacesListModel {
    
    var resultData: [Local] = []
    var currentPage: Int = 0
    var isFetchingPlaces: Bool = false

    var searchString: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    fileprivate let dispose = DisposeBag()
    
    /**
        Observable Interactor initialization
     **/
    var placesBehaviorSubject: BehaviorSubject<[Local]>
    
    override init () {
        self.placesBehaviorSubject = BehaviorSubject<[Local]>(value: resultData)
        super.init()
    }
    
    func getNextPlacesPage() {
        getNextPage {
            self.placesBehaviorSubject.on(.next(self.resultData))
        }
    }
    
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String) {
        if (!isFetchingPlaces) {
            self.latitude = latitude
            self.longitude = longitude
            self.searchString = searchString
            self.currentPage = 0
            self.resultData = []
        }
    }
}
