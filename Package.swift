import PackageDescription

let package = Package(
    name: "PunaUI",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PunaUI",
            targets: ["PunaUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/PureLayout/PureLayout.git", from: "3.1.9")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PunaUI",
            dependencies: [
                "PureLayout"
            ]),
        .testTarget(
            name: "PunaUITests",
            dependencies: ["PunaUI"]),
    ]
)
