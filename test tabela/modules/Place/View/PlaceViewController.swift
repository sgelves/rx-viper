//
//  PlacePlaceViewController.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, Storyboarded, PlaceViewInput {
    
    @IBOutlet weak var titleLAbel: UILabel!
    @IBOutlet weak var descriptionLAbel: UILabel!
    
    var output: PlaceViewOutput!
    var place: Local?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: PlaceViewInput
    func setupInitialState(place: Local?) {
        self.place = place
        titleLAbel.text = place?.placeName
        descriptionLAbel.text = place?.addres
    }
}
