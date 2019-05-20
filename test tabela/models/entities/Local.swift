//
//  Local.swift
//  test tabela
//
//  Created by user155532 on 5/18/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class Local: NSObject {

    /*
     Example:
         {
             "distance": 5995.8232856420382,
             "placeCityLongitude": -48.6356285,
             "placeCityName": "Balneário Camboriú",
             "placeCityStateAbbrev": "SC",
             "admin": true,
             "placeStreet": "Avenida do Estado Dalmo Vieira",
             "placeCityStateName": "Santa Catarina",
             "placeCityLatitude": -26.9930938,
             "placePhoto": "https://img.codemoney.com.br/5168d623-f59a-4383-9b7d-119bb7dd878d.jpg",
             "photo": "https://img.codemoney.com.br/5572ff1c-2f5f-493c-b39d-5a86b486d94d.jpg",
             "placeName": "Bestburguer - BC",
             "placeLocal": "Avenida do Estado Dalmo Vieira, 2481, Balneário Camboriú - SC",
             "phoneNumber": "4732240368",
             "email": "hbestburguer@gmail.com",
             "latitude": -26.977166,
             "longitude": -48.639669,
             "address": "Avenida do Estado Dalmo Vieira, 2481 - Centro - Balneário Camboriú/SC",
             "placeDescription": "Horário de atendimento\nDas 20:30h às 23h de terça à quinta-feira e aos domingos. \nSexta-feira e sábado, atendimento extendido até às 0h.",
             "id": "31d65458-320d-494f-a694-646f0d00ddac",
             "blocked": false,
             "salePromotion": 0,
             "promotion": 0,
             "totalPromotion": 0,
             "placeCategoryName": "Hamburgueria",
             "placeCategoryId": 2,
             "ratingAvarage": 5,
             "appear": true
         }
    */
    var id: String
    var distance: Float = 0.0
    var placePhoto: String?
    var placeName: String
    var addres: String = ""
    var blocked: Bool = false
    var placeCategoryName: String?
    var placeCategoryId: Int = 0
    var ratingAverage: Float?
    var appear: Bool = true
    
    init (dictionary: Dictionary<String, Any>) {
        self.id = dictionary["id"] as! String
        self.placeName = dictionary["placeName"] as! String
        self.placePhoto = dictionary["placePhoto"] as? String
        // to avoid error: Unable to bridge NSNumber to Float: file
        if let ratingAverage: NSNumber = dictionary["ratingAvarage"] as? NSNumber {
            self.ratingAverage = Float(ratingAverage.floatValue)
        }
        if let distance: NSNumber = dictionary["distance"] as? NSNumber {
            self.distance = Float(distance.floatValue)
        }
        self.placeCategoryName = dictionary["placeCategoryName"] as? String
    }
}
