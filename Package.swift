import PackageDescription

let package = Package(
    name: "Site",
    dependencies: [
        // Blackfish stuff
        .Package(url: "https://github.com/elliottminns/orca-mongodb", majorVersion: 0),
        .Package(url: "https://github.com/elliottminns/blackfish-stencil", majorVersion: 0),
        //.Package(url: "https://github.com/czechboy0/Jay", majorVersion: 0),
    ]
)
