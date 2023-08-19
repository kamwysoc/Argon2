// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let argonCTarget: Target = .target(name: "phc-winner-argon2",
                                   dependencies: [],
                                   path: "phc-winner-argon2",
                                   exclude: [
                                    "kats",
                                    "vs2015",
                                    "latex",
                                    "libargon2.pc.in",
                                    "export.sh",
                                    "appveyor.yml",
                                    "Argon2.sln",
                                    "argon2-specs.pdf",
                                    "CHANGELOG.md",
                                    "LICENSE",
                                    "Makefile",
                                    "man",
                                    "README.md",
                                    "src/bench.c",
                                    "src/genkat.c",
                                    "src/opt.c",
                                    "src/run.c",
                                    "src/test.c"
                                   ],
                                   sources: [
                                    "src/blake2/blake2b.c",
                                    "src/argon2.c",
                                    "src/core.c",
                                    "src/encoding.c",
                                    "src/ref.c",
                                    "src/thread.c"
                                   ]
)

let mainTarget: Target = .target(name: "SignalArgon2",
                                 dependencies: ["phc-winner-argon2"],
                                 path: "ios",
                                 sources: ["src"])

let testTarget: Target = .testTarget(name: "SignalArgon2Tests",
                                     dependencies: ["SignalArgon2"],
                                     path: "ios",
                                     sources: ["tests"])


let package = Package(
    name: "SignalArgon2-iOS",
    products: [
        .library(
            name: "SignalArgon2",
            targets: ["SignalArgon2"]),
    ],
    targets: [mainTarget, testTarget, argonCTarget]
)

