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
        .package(url: "https://github.com/myTargetSDK/mytarget-ios-spm", exact: "5.45.0"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealMyTargetAdapter/5.45.0.0/e7122d29d211/AppodealMyTargetAdapter.xcframework.zip",
            checksum: "e7122d29d211a7cb0ede3b55e4a9d157fb46fc057baec4130523a47cbbf540a9"
        ),

    ]
)
