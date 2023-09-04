// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "UI",
  defaultLocalization: "en",
  platforms: [
    .iOS("17.0"),
  ],
  products: [
    .library(name: "UI", targets: ["UI"]),
  ],
  targets: [
    .target(
      name: "UI",
      path: ".",
      exclude: ["test"],
      sources: ["src"],
      resources: [
        .process("assets"),
      ],
      swiftSettings: [
        .define("DEBUG", .when(configuration: .debug)),
      ]
    ),
    .testTarget(
      name: "UITests",
      dependencies: ["UI"],
      path: "test",
      resources: [
        .copy("assets"),
      ]
    ),
  ]
)
