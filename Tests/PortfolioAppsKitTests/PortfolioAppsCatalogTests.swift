import XCTest
import SwiftUI
@testable import PortfolioAppsKit

final class PortfolioAppsCatalogTests: XCTestCase {
    func testOtherAppsExposeExpectedOrderedNames() {
        XCTAssertEqual(
            PortfolioAppCatalog.otherApps.map(\.name),
            ["My Vinyl+", "What the Score", "EchoAI"]
        )
    }

    func testOtherAppsCanExcludeCurrentAppByEnum() {
        XCTAssertEqual(
            PortfolioAppCatalog.otherApps(excluding: .whatTheScore).map(\.name),
            ["My Vinyl+", "EchoAI"]
        )
    }

    func testOtherAppsUseHTTPSURLs() {
        for app in PortfolioAppCatalog.otherApps {
            XCTAssertEqual(app.appStoreURL.scheme, "https")
        }
    }

    @MainActor
    func testReusableViewsArePubliclyConstructible() {
        let app = PortfolioAppCatalog.otherApps[0]
        _ = OtherAppRow(app: app)
        _ = OtherAppsSection()
        _ = OtherAppsSection(excluding: .echoAI)
    }
}
