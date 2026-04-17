import SwiftUI

public struct OtherAppRow: View {
    public let app: PortfolioApp

    public init(app: PortfolioApp) {
        self.app = app
    }

    public var body: some View {
        Link(destination: app.appStoreURL) {
            HStack(spacing: 14) {
                app.iconImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .clipShape(.rect(cornerRadius: 7))

                Text(app.name)
                    .font(.body)
                    .foregroundStyle(.primary)

                Spacer()

                Image(systemName: "arrow.up.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
            }
            .padding(.vertical, 6)
            .contentShape(Rectangle())
        }
        .tint(.primary)
    }
}
