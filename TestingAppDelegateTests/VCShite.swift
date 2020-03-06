//
//  VCShite.swift
//  TestingAppDelegateTests
//
//  Created by Sabrina Tardio on 05/03/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class VCShite: XCTestCase {


    func testBlue() {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        
        
        let vc = VCFactory().makeBlueScreen(blueViewModel: MockVMFactory().makeBlueScreenViewModel())
        
        window.rootViewController = vc
        
        XCTAssertNotNil(window.viewWithTag(2))
    }
    
    func testYellow()
    {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
        let vc = VCFactory().makeYellowScreen(yellowViewModel: MockYellowScreenViewModel())
        
        window.rootViewController = vc
        let theView = window.viewWithTag(1)
        theView?.subviews.count == 3
//        view.findViewByID(R.id.cellTextLabel)
        XCTAssertNotNil(theView)
        
    }


}
