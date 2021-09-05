//
//  aui_tests.swift
//  aui-tests
//
//  Created by Bailey Pearson on 9/4/21.
//

import XCTest

class aui_tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

      
      app/*@START_MENU_TOKEN@*/.tabBars["Tab Bar"]/*[[".otherElements[\"tabbar\"].tabBars[\"Tab Bar\"]",".tabBars[\"Tab Bar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Monthly Overview"].tap()
      
      let tablesQuery = app/*@START_MENU_TOKEN@*/.tables/*[[".otherElements[\"tabbar\"].tables",".tables"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      let element = tablesQuery.children(matching: .other).element(boundBy: 2).children(matching: .other).element
      element.swipeUp()
      tablesQuery.cells["Fitness, $93.00"].otherElements.containing(.staticText, identifier:"Fitness").element.swipeDown()
      app/*@START_MENU_TOKEN@*/.navigationBars["September 2021"]/*[[".otherElements[\"tabbar\"].navigationBars[\"September 2021\"]",".navigationBars[\"September 2021\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["add"].tap()
      
      let tablesQuery2 = app.tables
      tablesQuery2/*@START_MENU_TOKEN@*/.textFields["Description"]/*[[".cells[\"Description\"].textFields[\"Description\"]",".textFields[\"Description\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      
      let amountTextField = tablesQuery2/*@START_MENU_TOKEN@*/.textFields["Amount"]/*[[".cells[\"Amount\"].textFields[\"Amount\"]",".textFields[\"Amount\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      amountTextField.tap()
      amountTextField.tap()
      tablesQuery2/*@START_MENU_TOKEN@*/.buttons["Category"]/*[[".cells[\"Category\"].buttons[\"Category\"]",".buttons[\"Category\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
      tablesQuery2/*@START_MENU_TOKEN@*/.textFields["Amount"]/*[[".cells.textFields[\"Amount\"]",".textFields[\"Amount\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      tablesQuery2/*@START_MENU_TOKEN@*/.buttons["Save Transaction"]/*[[".cells[\"Save Transaction\"].buttons[\"Save Transaction\"]",".buttons[\"Save Transaction\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      app.alerts["Success!"].scrollViews.otherElements.buttons["OK"].tap()
      element.swipeUp()
      tablesQuery.children(matching: .cell).matching(identifier: "5, Chipotle, -$32.00, Sep, Utilities").element(boundBy: 0).otherElements.containing(.staticText, identifier:"5").element.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
