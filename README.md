# Refds Algorithm

[![CI](https://github.com/rafaelesantos/refds-algorithm/actions/workflows/swift.yml/badge.svg?branch=main)](https://github.com/rafaelesantos/refds-algorithm/actions/workflows/swift.yml)

This Swift Package Manager repository contains a collection of commonly used algorithms and data structures implemented in Swift. Whether you're a beginner learning algorithms or an experienced developer looking for ready-to-use implementations, this package aims to provide a comprehensive set of tools to enhance your projects.

## Installation

Add this project to your `Package.swift` file.

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/rafaelesantos/refds-algorithm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: [
                .product(
                    name: "RefdsAlgorithm",
                    package: "refds-algorithm"),
            ]),
    ]
)
```
