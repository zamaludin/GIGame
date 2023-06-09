// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GIGame",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GIGame",
            targets: ["GIGame"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(path: "../GIAPI"),
      .package(path: "../GICommon"),
      .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0")),
      .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMajor(from: "3.0.1")),
      
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GIGame",
            dependencies: [
                "GIAPI",
                "GICommon",
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Mocker", package: "Mocker")
            ]
        ),
        .testTarget(
            name: "GIGameTests",
            dependencies: ["GIGame"],
            resources: [
              .process("games.json"),
              .process("gamedetail.json")
            ]
        )
    ]
)
