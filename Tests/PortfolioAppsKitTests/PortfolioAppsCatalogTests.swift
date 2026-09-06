import XCTest
import SwiftUI
@testable import PortfolioAppsKit

final class PortfolioAppsCatalogTests: XCTestCase {
    func testOtherAppsExposeExpectedOrderedNames() {
        XCTAssertEqual(
            PortfolioAppCatalog.otherApps.map(\.name),
            ["My Vinyl+", "What the Score", "EchoAI", "MapInk: Map Notes"]
        )
    }

    func testOtherAppsCanExcludeCurrentAppByEnum() {
        XCTAssertEqual(
            PortfolioAppCatalog.otherApps(excluding: .whatTheScore).map(\.name),
            ["My Vinyl+", "EchoAI", "MapInk: Map Notes"]
        )

        XCTAssertEqual(
            PortfolioAppCatalog.otherApps(excluding: .mapInk).map(\.name),
            ["My Vinyl+", "What the Score", "EchoAI"]
        )
    }

    func testOtherAppsUseHTTPSURLs() {
        for app in PortfolioAppCatalog.otherApps {
            XCTAssertEqual(app.appStoreURL.scheme, "https")
        }
    }

    func testCatalogAppStoreIdentifiers() {
        XCTAssertEqual(
            PortfolioAppCatalog.otherApps.map(\.appStoreID),
            ["1547173908", "1609259034", "6761034332", "6768144274"]
        )
    }

    func testAppStoreIdentifierSupportsLocalizedURLsAndQueryParameters() {
        for url in [
            "https://apps.apple.com/gb/app/example/id123456789?pt=123&ct=portfolio",
            "https://apps.apple.com/us/app/id123456789",
            "https://apps.apple.com/app/example/id123456789"
        ] {
            XCTAssertEqual(appStoreID(for: url), "123456789", url)
        }
    }

    func testAppStoreIdentifierRejectsMissingAndInvalidIdentifiers() {
        for url in [
            "https://apple.co/41yJhHM",
            "https://example.com/app/id123456789",
            "https://apps.apple.com.example.com/app/id123456789",
            "https://apps.apple.com/gb/app/example",
            "https://apps.apple.com/gb/app/example/id",
            "https://apps.apple.com/gb/app/example/id123abc",
            "https://apps.apple.com/gb/app/example/id123/reviews",
            "ftp://apps.apple.com/gb/app/example/id123456789"
        ] {
            XCTAssertNil(appStoreID(for: url), url)
        }
    }

    private func appStoreID(for url: String) -> String? {
        PortfolioApp(
            id: "example",
            name: "Example",
            assetName: "Example",
            appStoreURL: URL(string: url)!
        ).appStoreID
    }

    @MainActor
    func testReusableViewsArePubliclyConstructible() {
        let app = PortfolioAppCatalog.otherApps[0]
        _ = OtherAppRow(app: app)
        _ = OtherAppsSection()
        _ = OtherAppsSection(excluding: .echoAI)
    }
}
