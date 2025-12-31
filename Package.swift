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
        // すでにあればそのまま
        // .package(url: "...", from: "x.y.z"),

        // 🔐 追加：SecureDeliveryCore への依存
        .package(path: "../SecureDeliveryCore")
        // or .package(url: "https://github.com/…/SecureDeliveryCore.git", from: "0.1.0")
    ],
    targets: [
        // 既存のコア
        .target(
            name: "PklSprout",
            dependencies: []
        ),

        // 🔐 セキュア拡張
        .target(
            name: "PklSproutSecure",
            dependencies: [
                "PklSprout",
                "SecureDeliveryCore"
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
