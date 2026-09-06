import SwiftUI
#if os(iOS)
import StoreKit
#endif

public struct OtherAppRow: View {
    public let app: PortfolioApp
    #if os(iOS)
    @State private var isOverlayPresented = false
    #endif

    public init(app: PortfolioApp) {
        self.app = app
    }

    public var body: some View {
        #if os(iOS)
        if let appStoreID = app.appStoreID {
            Button {
                isOverlayPresented = true
            } label: {
                rowLabel(symbol: "arrow.down.app")
            }
            .buttonStyle(.plain)
            .appStoreOverlay(isPresented: $isOverlayPresented) {
                SKOverlay.AppConfiguration(appIdentifier: appStoreID, position: .bottom)
            }
            .onDisappear {
                isOverlayPresented = false
            }
        } else {
            appStoreLink
        }
        #else
        appStoreLink
        #endif
    }

    private var appStoreLink: some View {
        Link(destination: app.appStoreURL) {
            rowLabel(symbol: "arrow.up.right")
        }
        .tint(.primary)
    }

    private func rowLabel(symbol: String) -> some View {
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

            Image(systemName: symbol)
                .font(.caption.weight(.semibold))
                .foregroundStyle(.tertiary)
                .accessibilityHidden(true)
        }
        .padding(.vertical, 6)
        .contentShape(Rectangle())
    }
}
