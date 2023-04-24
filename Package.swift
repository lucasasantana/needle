// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "NeedleFoundation",
    platforms: [
        .macOS(.v10_15), .iOS(.v11)
    ],
    products: [
        .library(name: "NeedleFoundation", targets: ["NeedleFoundation"]),
        .library(name: "NeedleFoundationTest", targets: ["NeedleFoundationTest"]),
        .plugin(name: "NeedleGeneratorBuildPlugin", targets: ["NeedleGeneratorBuildPlugin"])
    ],
    dependencies: [
        .package(path: "./Generator")
    ],
    targets: [
        .plugin(
            name: "NeedleGeneratorBuildPlugin",
            capability: .buildTool(),
            dependencies: [
                .product(name: "needle", package: "Generator")
            ]
        ),
        .target(
            name: "NeedleFoundation",
            dependencies: []),
        .testTarget(
            name: "NeedleFoundationTests",
            dependencies: ["NeedleFoundation"],
            exclude: []),
        .target(
            name: "NeedleFoundationTest",
            dependencies: ["NeedleFoundation"]),
        .testTarget(
            name: "NeedleFoundationTestTests",
            dependencies: ["NeedleFoundationTest"],
            exclude: []),
    ],
    swiftLanguageVersions: [.v5]
)
