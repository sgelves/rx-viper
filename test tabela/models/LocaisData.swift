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
    
}

extension LocaisData {
    
    func getNextPage(completionHandler: @escaping () -> Void) {
        if (self.isLoading || self.currentPage < 0) {
            return
        }
        self.isLoading = true
        ResultsService.queryResults(page: self.currentPage, latitude: -27.0912233,
                                    longitude: -48.8892335, searchString: "") { data in
            guard data != nil else {
                self.isLoading = false
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
                                        
            self.isLoading = false
            completionHandler()
        }
        
    }
}
