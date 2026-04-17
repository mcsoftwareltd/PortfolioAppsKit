import Foundation
import SwiftUI

public struct PortfolioApp: Identifiable, Equatable, Sendable {
    public let id: String
    public let name: String
    public let assetName: String
    public let appStoreURL: URL

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
