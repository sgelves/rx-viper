//
//  PlacesPlacesInteractorInput.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import Foundation
import RxSwift

protocol PlacesInteractorInput {
    
    var placesBehaviorSubject: BehaviorSubject<[Local]> { get set }
    
    func getNextPlacesPage()
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String)
    
}
