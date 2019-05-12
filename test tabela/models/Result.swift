//
//  Result.swift
//  test tabela
//
//  Created by user155532 on 5/12/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class Result: NSObject {
    
    var id: Int
    var title: String
    var thumbnail: String?
    
    override init () {
        id = 0
        title = ""
        thumbnail = ""
    }
    
    init (dictionary: Dictionary<String, Any>) {
        self.id = dictionary["id"] as! Int
        self.title = dictionary["title"] as! String
        self.thumbnail = dictionary["thumbnail"] as? String
    }
}
