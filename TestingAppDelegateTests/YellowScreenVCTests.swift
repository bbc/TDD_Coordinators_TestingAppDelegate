//
//  YellowScreenVCTests.swift
//  TestingAppDelegateTests
//
//  Created by Sabrina Tardio on 06/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class YellowScreenVCTests: XCTestCase {

    func testYellowVCIsCreatedAndHasAButton()
    {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let vc = VCFactory().makeYellowScreen(yellowViewModel: MockYellowScreenViewModel())
        
        window.rootViewController = vc
        let theView = window.viewWithTag(ViewTag.yellowVc.rawValue)
        let button = window.viewWithTag(ViewTag.yellowVCButton.rawValue)

        XCTAssertNotNil(theView)
        XCTAssertNotNil(button)
        
    }

}
