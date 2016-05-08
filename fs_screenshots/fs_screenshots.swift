//
//  fs_screenshots.swift
//  fs_screenshots
//
//  Created by swilson on 5/8/16.
//  Copyright © 2016 swilson. All rights reserved.
//

import XCTest

class fs_screenshots: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.



      
      
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
      
      let app = XCUIApplication()
      setupSnapshot(app)
      app.launch()
      
      snapshot("1_tealController")
      app.textFields["tealTextBox"].tap()
      app.textFields["tealTextBox"].typeText("abc")
      snapshot("2_abcText")
      app.buttons["tealButton"].tap()
      snapshot("3_grayController")
      app.textFields["grayTextBox"].tap()
      app.textFields["grayTextBox"].typeText("123")
      snapshot("4_123Text")
      app.buttons["grayButton"].tap()
      
      snapshot("5_backToTeal")
      
      
      
    }
    
}
