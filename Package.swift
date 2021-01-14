// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Syntax",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(name: "Syntax",
                 targets: ["Syntax"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nerdsupremacist/SyntaxTree.git", .branch("main")),
    ],
    targets: [
        .target(name: "Syntax",
                dependencies: ["SyntaxTree"]),

        .testTarget(name: "SyntaxTests",
                    dependencies: ["Syntax"]),
    ]
)
