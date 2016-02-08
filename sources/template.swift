import Stencil

func getTemplate(context: Context) -> String {
  do {
    let template = try Template(path: "Resources/Templates/index.mustache")
    let rendered = try template.render(context)

    return rendered
  } catch {
    return "\(error)"
  }
}

func getTemplate(dictionary: [String: String]) -> String {
  var contextDictionary:[String: Any] = [:]

  contextDictionary["loader"] = TemplateLoader(paths: ["./Resources/Templates/"])

  // Append to the context dictionary
  for (key, value) in dictionary {
    contextDictionary[key] = value
  }

  let context = Context(dictionary: contextDictionary)
  return getTemplate(context)
}
