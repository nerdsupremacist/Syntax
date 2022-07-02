// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "Syntax",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "Syntax",
                 targets: ["Syntax"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nerdsupremacist/SyntaxTree.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "Syntax",
                dependencies: ["SyntaxTree"],
                exclude: ["FunctionBuilder/ParserBuilder.swift.gyb"]),

        .testTarget(name: "SyntaxTests",
                    dependencies: ["Syntax"]),
    ]
)
