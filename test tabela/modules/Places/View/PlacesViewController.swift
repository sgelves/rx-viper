//
//  PlacesPlacesViewController.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController, PlacesViewInput {

    var output: PlacesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PlacesViewInput
    func setupInitialState() {
    }
}
