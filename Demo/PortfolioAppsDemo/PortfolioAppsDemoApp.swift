import PortfolioAppsKit
import SwiftUI

@main
struct PortfolioAppsDemoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Tap an app to show its installation banner.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        OtherAppsSection()
                    }
                    .padding()
                }
                .background(Color(uiColor: .systemGroupedBackground))
                .navigationTitle("Portfolio Apps")
            }
        }
    }
}
