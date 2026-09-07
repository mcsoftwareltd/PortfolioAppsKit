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

## Demo app

Open `Demo/PortfolioAppsDemo.xcodeproj` and select the `PortfolioAppsDemo` scheme. For a physical iPhone, select your signing team in the target's Signing & Capabilities settings, choose the device, and run.

Tap any app row to test the bottom installation banner. The demo references this checkout directly, so package changes are included on the next build without publishing a release. Verify the actual StoreKit banner and installation on a physical device with App Store access.

The Xcode project is checked in. If you edit its configuration in `Demo/project.yml`, regenerate it with `xcodegen generate --spec Demo/project.yml`.
