import PackageDescription

let package = Package(
    name: "Site",
    dependencies: [
        .Package(url: "https://github.com/elliottminns/blackfish", majorVersion: 0),
        .Package(url: "https://github.com/kylef/Stencil", majorVersion: 0)
    ]
)
