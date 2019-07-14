//
//  PlacePlaceViewInput.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

protocol PlaceViewInput: class {

    /**
        @author Sergio
        Setup initial state of the view
    */

    func setupInitialState(place: Local?)
}
