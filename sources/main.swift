import Blackfish

// MARK: Start App
let app = Blackfish()
let sql = SQLWrapper()

// MARK: Paths
app.get("/") { request, response in
  let dictionary = [
    "stuff": "Tester",
    "middle": "Vertex will allow you to <span>connect, interact</span> and <span>share</span> in a whole new way"
  ]

  print("Response: \(response.status)")

  sql.connect("tester.db")

  response.send(text: getTemplate(dictionary))
}

app.post("/stuff") { request, response in
  let context = [
    "middle": "\(request.data)"
  ]

  response.send(text: getTemplate(context))
}

// MARK: Listen
app.listen(port: 80) { error in
  if error != nil {
    print("Error: \(error)")
  } else {
    print("Listening on port: 80")
  }
}
