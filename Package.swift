import PackageDescription

let package = Package(
    name: "Site",
    dependencies: [
        .Package(url: "https://github.com/elliottminns/blackfish", majorVersion: 0)
    ]
)
