//
//  PlacesPlacesInitializer.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlacesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var placesViewController: PlacesViewController!

    override func awakeFromNib() {

        let configurator = PlacesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: placesViewController)
    }

}
