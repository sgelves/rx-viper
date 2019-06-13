//
//  PlacesPlacesInteractor.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation

class PlacesInteractor: NSObject, PlacesInteractorInput, InfinitePlacesListModel {

    weak var output: PlacesInteractorOutput!
    
    var resultData: [Local] = []
    var currentPage: Int = 0
    var isFetchingLoais: Bool = false
    var searchString: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    func getNextPlacesPage() {
        getNextPage {
            self.output.setNextPlacesPage(data: self.resultData)
        }
    }
    
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String) {
        if (!isFetchingLoais) {
            self.latitude = latitude
            self.longitude = longitude
            self.searchString = searchString
            self.currentPage = 0
            self.resultData = []
        }
    }
}
