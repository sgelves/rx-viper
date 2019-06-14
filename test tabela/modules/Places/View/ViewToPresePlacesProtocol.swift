//
//  PlacesPlacesViewOutput.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import RxSwift

protocol ViewToPresePlacesProtocol {

    /**
        @author Sergio
        Notify presenter that view is ready
    */
    var uiviewDidLoad: PublishSubject<Bool> { get }
    var loadMoreResultData: PublishSubject<Bool> { get }
    var resetResultData: PublishSubject<Dictionary<String, Any>> { get }
    var selectedPlace: PublishSubject<Local> { get }
    var uiviewDidFinish: PublishSubject<Bool> { get }
    
    
    func placesHasChanged(places: [Local])
}
