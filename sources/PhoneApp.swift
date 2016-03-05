import Orca

class PhoneApp: Model {
    var identifier: String?

    static var schema: [String: DataType.Type] {
      return [
        "name": String.self,
        "version": Double.self,
        "OS": String.self
      ]
    }

    var name: String?
    var version: Double?
    var OS: String?

    init(name: String, OS: String) {
      self.name     = name
      self.OS       = OS
      self.version  = 0.1
    }

    required init?(serialized: [String: DataType]) {
      self.identifier = serialized["identifier"] as? String
      self.name       = serialized["name"] as? String
      self.OS         = serialized["OS"] as? String
      self.version    = serialized["version"] as? Double
    }
}
