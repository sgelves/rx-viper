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
    
    let DOMAIN = "http://private-00fe4-sergiogelves.apiary-mock.com"
    
    func queryResults (completionHanlder: @escaping (_ res: [Result]?) -> Void) {

        Alamofire.request("\(DOMAIN)/results-with-image").validate().responseJSON { response in
            // response serialization result
            switch response.result {
            case .success(let jsonArray):
                
                guard let responseArray = jsonArray as? Array<Dictionary<String, Any>> else {
                    print("malformed response ResultsService")
                    completionHanlder(nil)
                    return
                }
                
                var data: [Result] = []
                for resultDictionary in responseArray {
                    data.append(Result(dictionary: resultDictionary))
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
