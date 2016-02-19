import PackageDescription

let package = Package(
    name: "Site",
    dependencies: [
        // Blackfish stuff
        .Package(url: "https://github.com/elliottminns/orca-mongodb", majorVersion: 0),
        .Package(url: "https://github.com/elliottminns/blackfish", majorVersion: 0),

        // 3rd party
        .Package(url: "https://github.com/kylef/Stencil", majorVersion: 0),
    ]
)
