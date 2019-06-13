//
//  PlacePlaceInteractor.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

class PlaceInteractor: PlaceInteractorInput {
    
    weak var output: PlaceInteractorOutput!
    private var place: Local?
    
    init(place: Local?) {
        self.place = place
    }
    
    func getPlace () -> Local? {
        return self.place
    }
    
}
