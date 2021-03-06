// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import XCTest

class ENAUITestsHome: XCTestCase {
	var app: XCUIApplication!

	override func setUpWithError() throws {
		continueAfterFailure = false
		app = XCUIApplication()
		setupSnapshot(app)
		app.setDefaults()
		app.launchArguments = ["-isOnboarded", "YES"]
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func test_0010_HomeFlow_medium() throws {
		app.setPreferredContentSizeCategory(accessibililty: .normal, size: .XS)
		app.launch()

		// only run if onboarding screen is present
		XCTAssertNotNil(app.staticTexts[Accessibility.StaticText.homeActivateTitle])

		app.swipeUp()
		// assert cells
		XCTAssert(app.cells[Accessibility.Cell.infoCardShareTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.infoCardAboutTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.appInformationCardTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.settingsCardTitle].exists)
		snapshot("ScreenShot_\(#function)")
	}

	func test_0011_HomeFlow_extrasmall() throws {
		app.setPreferredContentSizeCategory(accessibililty: .normal, size: .M)
		app.launch()

		// only run if onboarding screen is present
		XCTAssertNotNil(app.staticTexts[Accessibility.StaticText.homeActivateTitle])

		app.swipeUp()
		// assert cells
		XCTAssert(app.cells[Accessibility.Cell.infoCardShareTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.infoCardAboutTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.appInformationCardTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.settingsCardTitle].exists)
		snapshot("ScreenShot_\(#function)")
	}

	func test_0013_HomeFlow_extralarge() throws {
		app.setPreferredContentSizeCategory(accessibililty: .accessibility, size: .XL)
		app.launch()

		// only run if onboarding screen is present
		XCTAssertNotNil(app.staticTexts[Accessibility.StaticText.homeActivateTitle])

		app.swipeUp()
		app.swipeUp()
		// assert cells
		XCTAssert(app.cells[Accessibility.Cell.infoCardShareTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.infoCardAboutTitle].exists)
		app.swipeUp()
		XCTAssert(app.cells[Accessibility.Cell.appInformationCardTitle].exists)
		XCTAssert(app.cells[Accessibility.Cell.settingsCardTitle].exists)
		snapshot("ScreenShot_\(#function)")
	}
}
