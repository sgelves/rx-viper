//
//  PlacePlaceInitializer.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class PlaceModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var placeViewController: PlaceViewController!

    override func awakeFromNib() {

        let configurator = PlaceModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: placeViewController)
    }

}
