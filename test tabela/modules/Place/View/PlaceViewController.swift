//
//  PlacePlaceViewController.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, PlaceViewInput {

    var output: PlaceViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PlaceViewInput
    func setupInitialState() {
    }
}
