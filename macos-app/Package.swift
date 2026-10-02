// swift-tools-version:5.9
// ApriP7mCore: pure Swift port of apri_p7m/core.py + preferenze.py,
// no AppKit/SwiftUI dependency so `swift test` runs headless in CI —
// mirrors the separation already used on Android (cms/Estrazione.kt vs
// ApriP7mActivity.kt). Uses only Security.framework (system, no
// external SwiftPM dependency) — see project-docs/status/macos-swift.md
// for why (CMSDecoder evaluation, step 1.1 of the plan).
//
// ApriP7mApp: the SwiftUI app itself, depends on ApriP7mCore.
import PackageDescription

let package = Package(
    name: "ApriP7mCore",
    platforms: [.macOS(.v11)],
    products: [
        .library(name: "ApriP7mCore", targets: ["ApriP7mCore"]),
        .executable(name: "ApriP7mApp", targets: ["ApriP7mApp"]),
    ],
    targets: [
        .target(name: "ApriP7mCore"),
        .executableTarget(name: "ApriP7mApp", dependencies: ["ApriP7mCore"]),
        .testTarget(
            name: "ApriP7mCoreTests",
            dependencies: ["ApriP7mCore"],
            resources: [.copy("Resources")]
        ),
    ]
)
