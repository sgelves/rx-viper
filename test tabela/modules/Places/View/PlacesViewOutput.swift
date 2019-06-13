//
//  PlacesPlacesViewOutput.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

protocol PlacesViewOutput {

    /**
        @author Sergio
        Notify presenter that view is ready
    */
    func viewIsReady()
    func initialUserDataCollected(latitude: Double, longitude: Double, searchString: String)
    func loadMoreData()
    func userSelectedPlace(place: Local)
    func viewDidFinish()
}
