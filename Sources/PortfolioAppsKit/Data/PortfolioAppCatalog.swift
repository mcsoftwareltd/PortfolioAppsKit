import Foundation

public enum PortfolioAppCatalog {
    public static let otherApps: [PortfolioApp] = [
        PortfolioApp(
            id: "my-vinyl-plus",
            name: "My Vinyl+",
            assetName: "MyVinylPlus",
            appStoreURL: URL(string: "https://apple.co/41yJhHM")!
        ),
        PortfolioApp(
            id: "what-the-score",
            name: "What the Score",
            assetName: "WhatTheScore",
            appStoreURL: URL(string: "https://apple.co/3YPvmHR")!
        ),
        PortfolioApp(
            id: "echo-ai",
            name: "EchoAI",
            assetName: "EchoAI",
            appStoreURL: URL(string: "https://apps.apple.com/gb/app/echoai-ai-meeting-recorder/id6761034332")!
        )
    ]
}
