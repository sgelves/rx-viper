//
//  ResultsService.swift
//  test tabela
//
//  Created by user155532 on 5/11/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit
import Alamofire

class ResultsService: NSObject {
    
    static let DOMAIN = "https://rest.codemoney.com.br/v2/"
    
    static func queryResults (page: Int, latitude: Double, longitude:Double, searchString: String,
                              completionHanlder: @escaping (_ res: [Local]?) -> Void) {
        
        let params = [
            "page": page,
            "lat": latitude,
            "lng": longitude,
            "searchString": searchString
            ] as [String : Any]

        Alamofire.request(
            "\(DOMAIN)sale/list-distance",
            method: .get,
            parameters: params,
            encoding: URLEncoding(destination: .queryString)
        ).validate().responseJSON { response in
            // response serialization result
            switch response.result {
            case .success(let jsonArray):
                
                guard let responseArray = jsonArray as? Array<Dictionary<String, Any>> else {
                    print("malformed response ResultsService")
                    completionHanlder(nil)
                    return
                }
                
                var data: [Local] = []
                for resultDictionary in responseArray {
                    data.append(Local(dictionary: resultDictionary))
                }
                completionHanlder(data)
            case .failure(let error):
                print(error.localizedDescription)
            }

        }

    }
}
