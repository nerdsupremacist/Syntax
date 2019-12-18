// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Ogma",
    platforms: [.iOS(.v10), .macOS(.v10_12)],
    products: [
        .library(name: "Ogma",
                 targets: ["Ogma"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Ogma",
                dependencies: [])
    ]
)
