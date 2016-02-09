import Blackfish
import Stencil

// MARK: Start App
let app = Blackfish()

// Template render
func getTemplate(context: Context, file: String) -> String? {
  do {
    let template = try Template(path: file as! Path)
    let rendered = try template.render(context)

    return rendered
  } catch {
    return nil
  }
}

// MARK: Paths
app.get("/") { request, response in
    let context = Context(dictionary: [
        "stuff": "Tester"
      ]
    );

    guard let render = getTemplate(context, file: "Resources/Templates/index.mustache") else { response.send(text: "Error") }
    response.send(text: render)
}

app.post("/stuff") { request, response in
  response.send(text: "Stuff \(request.data)")
}

// MARK: Listen
app.listen(port: 80) { error in
  if error == nil {
    print("Listening")
  }
}
