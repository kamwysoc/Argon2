// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let argonCTarget: Target = .target(name: "phc-winner-argon2",
                                   dependencies: [],
                                   path: "phc-winner-argon2",
                                   exclude: [
                                    "README.md",
                                    "man",
                                    "argon2-specs.pdf",
                                    "CHANGELOG.md",
                                    "vs2015",
                                    "src/blake2/blamka-round-opt.h"
                                   ],
                                   sources: [
                                    "phc-winner-argon2/src/argon2.c'",
                                    "phc-winner-argon2/src/core.{c,h}'",
                                    "phc-winner-argon2/src/thread.{c,h}'",
                                    "phc-winner-argon2/src/encoding.{c,h}'",
                                    "phc-winner-argon2/src/blake2/blake2.h'",
                                    "phc-winner-argon2/src/blake2/blake2b.c'",
                                    "phc-winner-argon2/src/blake2/blake2-imp.h",
                                    "phc-winner-argon2/include/**/*.h",
                                    "phc-winner-argon2/src/ref.c",
                                    "phc-winner-argon2/src/blake2/blamka-round-ref.h"
                                   ],
                                   publicHeadersPath: "include"
)

let mainTarget: Target = .target(name: "SignalArgon2",
                                 dependencies: ["phc-winner-argon2"],
                                 path: ".",
                                 exclude: [
                                    "android",
                                    "gradle",
                                    "Gemfile",
                                    "Gemfile.lock",
                                    "gradlew",
                                    "gradlew.bat",
                                    "LICENSE",
                                    "settings.gradle",
                                    "SignalArgon2.podspec",
                                 ],
                                 sources: [
                                    "ios/src"
                                 ],
                                 linkerSettings: [.linkedLibrary("phc-winner-argon2",
                                    .when(platforms: [.iOS]))])

let testTarget: Target = .testTarget(name: "SignalArgon2Tests",
                                     dependencies: ["SignalArgon2"])
testTarget.path = "ios/tests"


let package = Package(
    name: "SignalArgon2-iOS",
    products: [
        .library(
            name: "SignalArgon2",
            targets: ["SignalArgon2"]),
    ],
    targets: [mainTarget, testTarget, argonCTarget]
)

