// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealMyTargetAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealMyTargetAdapter",
            targets: ["AppodealMyTargetAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/myTargetSDK/mytarget-ios-spm", exact: "5.43.0"),
    ],
    targets: [
        .target(
            name: "AppodealMyTargetAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "MyTargetSDK", package: "mytarget-ios-spm"),
                .target(name: "AppodealMyTargetAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealMyTargetAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealMyTargetAdapter/5.43.0.0/AppodealMyTargetAdapter.xcframework.zip",
            checksum: "cda6b3e6b2dc2ff247641646c2b00a37b751e71e98b98b8b8207f47550067142"
        ),

    ]
)
