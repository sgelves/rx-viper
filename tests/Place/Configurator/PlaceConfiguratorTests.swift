//
//  PlacePlaceConfiguratorTests.swift
//  test-features-swift
//
//  Created by Sergio on 12/06/2019.
//  Copyright © 2019 sgelves. All rights reserved.
//

import XCTest

class PlaceModuleConfiguratorTests: XCTestCase {

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
        let viewController = PlaceViewControllerMock()
        let configurator = PlaceModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "PlaceViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PlacePresenter, "output is not PlacePresenter")

        let presenter: PlacePresenter = viewController.output as! PlacePresenter
        XCTAssertNotNil(presenter.view, "view in PlacePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PlacePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PlaceRouter, "router is not PlaceRouter")

        let interactor: PlaceInteractor = presenter.interactor as! PlaceInteractor
        XCTAssertNotNil(interactor.output, "output in PlaceInteractor is nil after configuration")
    }

    class PlaceViewControllerMock: PlaceViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
