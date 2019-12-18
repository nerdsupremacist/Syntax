
// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Ogma",
    platforms: [.iOS(.v12), .macOS(.v10_14)],
    products: [
        .library(name: "Ogma",
                 targets: ["Ogma"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "Ogma",
                dependencies: [],
	              path: "Ogma")
    ]
)
