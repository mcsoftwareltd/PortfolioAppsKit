import Foundation
import SwiftUI

public struct PortfolioApp: Identifiable, Equatable, Sendable {
    public let id: String
    public let name: String
    public let assetName: String
    public let appStoreURL: URL

    /// The numeric identifier used to present this app in a StoreKit overlay.
    public var appStoreID: String? {
        guard appStoreURL.host?.lowercased() == "apps.apple.com",
              ["https", "http"].contains(appStoreURL.scheme?.lowercased()),
              appStoreURL.lastPathComponent.hasPrefix("id") else {
            return nil
        }

        let identifier = appStoreURL.lastPathComponent.dropFirst(2)
        guard !identifier.isEmpty,
              identifier.allSatisfy({ $0 >= "0" && $0 <= "9" }) else {
            return nil
        }

        return String(identifier)
    }

    public init(id: String, name: String, assetName: String, appStoreURL: URL) {
        self.id = id
        self.name = name
        self.assetName = assetName
        self.appStoreURL = appStoreURL
    }

    public var iconImage: Image {
        Image(assetName, bundle: .module)
    }
}
