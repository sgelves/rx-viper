//
//  Result.swift
//  test tabela
//
//  Created by user155532 on 5/12/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

protocol LocaisData: NSObject {
    
    var resultData: [ Local] { get set }
    var currentPage: Int { get set }
    var isLoading: Bool { get set }
    var resultsService: ResultsService { get }
    
}

extension LocaisData {
    
    func getNextPage(completionHandler: @escaping () -> Void) {
        if (self.isLoading || self.currentPage < 0) {
            return
        }
        self.isLoading = true
        self.resultsService.queryResults() { data in
            self.isLoading = false
            guard data != nil else {
                return
            }
            
            for local in data! {
                self.resultData.append(local)
            }
            if (data!.count < 15) {
                self.currentPage = -1
            } else {
                self.currentPage += 15
            }
            completionHandler()
        }
        
    }
}
