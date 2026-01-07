// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PklSprout",
    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],
    products: [
        // 既存
        .library(
            name: "PklSprout",
            targets: ["PklSprout"]
        ),
        // 🔐 追加：セキュア拡張
        .library(
            name: "PklSproutSecure",
            targets: ["PklSproutSecure"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Moumousan/SecureDeliveryCore.git",
            branch: "main"      // or from: "1.0.0"
        ),
    ],
    targets: [
        // 既存のコア
        .target(
            name: "PklSprout",
            dependencies: [],
            path: "Sources/PklSprout"
        ),
        
        // 🔐 セキュア拡張
        .target(
            name: "PklSproutSecure",
            dependencies: [
                "PklSprout",
                .product(name: "SecureDeliveryCore", package: "SecureDeliveryCore")
            ],
            path: "Sources/PklSproutSecure"
        ),
        /*
         .testTarget(
         name: "PklSproutTests",
         dependencies: ["PklSprout", "PklSproutSecure"]
         )
         */
    ]
)
