//
//  Result.swift
//  test tabela
//
//  Created by user155532 on 5/12/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

protocol LocaisModel: NSObject {
    
    var resultData: [ Local] { get set }
    var currentPage: Int { get set }
    var isFetchingLoais: Bool { get set }
    
}

extension LocaisModel {
    
    func getNextPage(latitude: Double, longitude: Double, searchString: String, completionHandler: @escaping () -> Void) {
        if (self.isFetchingLoais || self.currentPage < 0) {
            return
        }
        self.isFetchingLoais = true
        ResultsService.queryResults(page: self.currentPage, latitude: latitude,
                                    longitude: longitude, searchString: searchString) { data in
            guard data != nil else {
                self.isFetchingLoais = false
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
                                        
            self.isFetchingLoais = false
            completionHandler()
        }
        
    }
    
    func restartLocaisState() {
        guard !self.isFetchingLoais else {
            return
        }
        self.resultData = []
        self.currentPage = 0
    }
}
