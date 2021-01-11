// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Syntax",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(name: "Syntax",
                 targets: ["Syntax"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Syntax",
                dependencies: []),

        .testTarget(name: "SyntaxTests",
                    dependencies: ["Syntax"]),
    ]
)
