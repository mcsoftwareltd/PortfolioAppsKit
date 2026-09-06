import Foundation

public enum PortfolioAppCatalog {
    public static let otherApps: [PortfolioApp] = [
        PortfolioApp(
            id: PortfolioAppIdentifier.myVinylPlus.rawValue,
            name: "My Vinyl+",
            assetName: "MyVinylPlus",
            appStoreURL: URL(string: "https://apps.apple.com/app/id1547173908?itscg=30200&itsct=apps_box_link")!
        ),
        PortfolioApp(
            id: PortfolioAppIdentifier.whatTheScore.rawValue,
            name: "What the Score",
            assetName: "WhatTheScore",
            appStoreURL: URL(string: "https://apps.apple.com/app/id1609259034")!
        ),
        PortfolioApp(
            id: PortfolioAppIdentifier.echoAI.rawValue,
            name: "EchoAI",
            assetName: "EchoAI",
            appStoreURL: URL(string: "https://apps.apple.com/gb/app/echoai-ai-meeting-recorder/id6761034332")!
        ),
        PortfolioApp(
            id: PortfolioAppIdentifier.mapInk.rawValue,
            name: "MapInk: Map Notes",
            assetName: "MapInk",
            appStoreURL: URL(string: "https://apps.apple.com/gb/app/mapink-map-notes/id6768144274")!
        )
    ]

    public static func otherApps(excluding excludedApp: PortfolioAppIdentifier?) -> [PortfolioApp] {
        guard let excludedApp else {
            return otherApps
        }

        return otherApps.filter { $0.id != excludedApp.rawValue }
    }
}
