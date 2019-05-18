//
//  ResultsService.swift
//  test tabela
//
//  Created by user155532 on 5/11/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ResultsService: NSObject {
    
    let DOMAIN = "https://rest.codemoney.com.br/v2/sale/list-distance"
    
    func queryResults (completionHanlder: @escaping (_ res: [Local]?) -> Void) {
        
        let params = [
            "page": 0,
            "lat": -27.0912233,
            "lng": -48.8892335,
            "searchString": ""
            ] as [String : Any]

        Alamofire.request(
            DOMAIN,
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
    
    func queryUrlImage (url: String, completionHandler: @escaping (UIImage)->Void) {
        Alamofire.request(url).responseImage { response in
            debugPrint(response)
            
            //print(response.request)
            //(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                completionHandler(image)
            }
        }
    }

}
