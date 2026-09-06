# PortfolioAppsKit

Reusable Swift package for displaying MC Software portfolio apps across iOS apps.

## Includes

- A package-owned catalog of portfolio apps and App Store URLs
- Bundled icon assets
- Reusable SwiftUI views, including `OtherAppsSection`
- On iOS, tapping an app presents Apple's bottom App Store overlay for installation without leaving the current app.

## Usage

Add the package in your Xcode project or project generator and import `PortfolioAppsKit`.

```swift
import PortfolioAppsKit

struct SettingsView: View {
    var body: some View {
        OtherAppsSection(excluding: .myVinylPlus)
    }
}
```

`OtherAppRow` uses the same installation banner when used on its own. macOS opens the App Store URL. Custom apps should use an `https://apps.apple.com/app/id123456789` URL so the package can extract the numeric App Store ID. URLs without a valid ID open as links instead.

The banner uses StoreKit and still downloads through the App Store. Its availability and install controls are managed by Apple.
