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
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  /// Function to solve the problem where UI testing uses button string instead of button ID
  func localizedString(key:String) -> String {
    
    print("deviceLanguage: " + deviceLanguage)
    
    var bundlename = deviceLanguage
    
    if (deviceLanguage == "en-US") {
      return key // US english is base language, no existing lproj file, so skio that step
    }
    else if (deviceLanguage == "zh-TW") {
      bundlename = "zh-Hant"
    }
    else if (deviceLanguage == "zh-CN") {
      bundlename = "zh-Hans"
    }
    print("bundlename: " + bundlename)
    
    // Get translated string for this bundle
    let localizationBundle = NSBundle(path: NSBundle(forClass: fs_screenshots.self).pathForResource(bundlename, ofType: "lproj")!)
    let result = NSLocalizedString("" + key + "", bundle:localizationBundle!, comment: "") //
    // For some reason, this commented out line below needs to be here for genstrings exports to pass...
    //let result = String(format: NSLocalizedString("%@", bundle:localizationBundle!, comment: ""),  key )
    return result
  }
  
  func testExample() {
      // Setup Test
      let app = XCUIApplication()
      setupSnapshot(app)
      app.launch()
      
      // If notifications popup appears on app first run, dismiss it.
      // Clearing permissions boxes (e.g., “Allow Notifications”) on first run
      addUIInterruptionMonitorWithDescription("Notifications Dialog") { (alert) -> Bool in
        let button = alert.buttons[self.localizedString("OK")]
        if button.exists {
          button.tap()
          return true
        }
        return false
      }
      app.tap() // need to interact with the app for the handler to fire
    
      snapshot("0_tealController") // takes a screenshot when running from Snapshot script
    
      // UITesting translation issues
      // If you set Button text to localized string, 
      // then create UITesting test 
      // ==> UITesting / App translation discrepancy
      // Use custom localizedString method to get around this.
      app.buttons[localizedString("USA English")].tap()
    
      sleep(2) // Wait for alert box to display.
      snapshot("1_tealControllerWithAlert")
      app.alerts["!!!"].collectionViews.buttons["OK"].tap()
      
      app.textFields["tealTextBox"].tap()
      app.textFields["tealTextBox"].typeText("abc")
      snapshot("2_abcText")
    
      app.buttons["tealButton"].tap()
      snapshot("3_grayController")
    
      app.textFields["grayTextBox"].tap()
      app.textFields["grayTextBox"].typeText("123")
      snapshot("4_123Text")
    
      app.buttons["grayButton"].tap()
    
    }
    
}
