import SwiftUI

public struct OtherAppsSection: View {
    private let apps: [PortfolioApp]

    public init(apps: [PortfolioApp] = PortfolioAppCatalog.otherApps) {
        self.apps = apps
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Other Apps")
                .font(.title3.weight(.semibold))
                .foregroundStyle(.secondary)
                .padding(.leading, 4)

            VStack(spacing: 0) {
                ForEach(Array(apps.enumerated()), id: \.element.id) { index, app in
                    OtherAppRow(app: app)

                    if index < apps.count - 1 {
                        Divider().padding(.leading, 48)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .background(sectionBackground, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }

    private var sectionBackground: Color {
        #if canImport(UIKit)
        Color(uiColor: .secondarySystemGroupedBackground)
        #elseif canImport(AppKit)
        Color(nsColor: .controlBackgroundColor)
        #else
        Color.secondary.opacity(0.12)
        #endif
    }
}
