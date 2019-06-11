//
//  PlacesPlacesConfiguratorTests.swift
//  test-features-swift
//
//  Created by Sergio on 11/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import XCTest

class PlacesModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = PlacesViewControllerMock()
        let configurator = PlacesModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "PlacesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PlacesPresenter, "output is not PlacesPresenter")

        let presenter: PlacesPresenter = viewController.output as! PlacesPresenter
        XCTAssertNotNil(presenter.view, "view in PlacesPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PlacesPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PlacesRouter, "router is not PlacesRouter")

        let interactor: PlacesInteractor = presenter.interactor as! PlacesInteractor
        XCTAssertNotNil(interactor.output, "output in PlacesInteractor is nil after configuration")
    }

    class PlacesViewControllerMock: PlacesViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
