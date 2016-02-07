import Blackfish

// MARK: Start App
let app = Blackfish()

// MARK: Paths
app.get("/") { request, response in
  print("Request: \(request)")
  print("Params: \(request.parameters)")
  print("Data: \(request.data)")
  print("Method: \(request.method)")
  print("Cookies: \(request.cookies)")
  print("Session: \(request.session)")

  response.render("html/index.html")
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
