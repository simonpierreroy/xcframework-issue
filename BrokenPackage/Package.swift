// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BrokenPackage",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BrokenPackage",
            type: .dynamic,
            targets: ["BrokenPackage"]),
    ],
    dependencies: [
        .package(name: "Braintree",  url: "git@github.com:braintree/braintree_ios.git", .exact("5.3.2")),
        .package(name: "Stripe", url: "git@github.com:stripe/stripe-ios.git", .exact("21.6.0"))

    ],
    targets: [
        .target(
            name: "BrokenPackage",
            dependencies: [
                "Stripe",
                .product(name: "BraintreeCore", package: "Braintree"),
                .product(name: "BraintreePayPal", package: "Braintree"),
                .product(name: "PayPalDataCollector", package: "Braintree"),
                .product(name: "PPRiskMagnes", package: "Braintree")
            ]
        )
    ]
)
