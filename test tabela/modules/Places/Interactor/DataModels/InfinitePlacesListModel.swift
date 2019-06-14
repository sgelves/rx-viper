//
//  Result.swift
//  test tabela
//
//  Created by user155532 on 5/12/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

protocol InfinitePlacesListModel: NSObject {
    
    var resultData: [ Local] { get set }
    var currentPage: Int { get set }
    var latitude: Double { get set }
    var longitude: Double { get set }
    var searchString: String { get set }
    var isFetchingPlaces: Bool { get set }
    
}

extension InfinitePlacesListModel {
    
    func getNextPage(completionHandler: @escaping () -> Void) {
        if (self.isFetchingPlaces || self.currentPage < 0) {
            return
        }
        self.isFetchingPlaces = true
        ResultsService.queryResults(page: self.currentPage, latitude: self.latitude,
                                    longitude: self.longitude, searchString: self.searchString) { data in
            guard data != nil else {
                self.isFetchingPlaces = false
                return
            }
            
            for local in data! {
                self.resultData.append(local)
            }
            if (data!.count < 15) {
                self.currentPage = -1
            } else {
                self.currentPage += 1
            }
                                        
            self.isFetchingPlaces = false
            completionHandler()
        }
        
    }
    
    func startLocaisState(latitude: Double, longitude: Double, searchString: String) {
        guard !self.isFetchingPlaces else {
            return
        }
        self.resultData = []
        self.currentPage = 0
        self.longitude = longitude
        self.latitude = latitude
        self.searchString = searchString
    }
}
