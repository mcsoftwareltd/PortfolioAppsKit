# PortfolioAppsKit

Reusable Swift package for displaying MC Software portfolio apps across iOS apps.

## Includes

- A package-owned catalog of portfolio apps and App Store URLs
- Bundled icon assets
- Reusable SwiftUI views, including `OtherAppsSection`

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
