import Foundation

import Blackfish
import BlackfishStencil

// MARK: Start App
let app = Blackfish()

// MARK: Renderer
app.use(renderer: StencilRenderer(), ext: ".mustache")

// MARK: Routes
app.use(path: "/", controller: IndexController())
//app.use(path: "/test", controller: TestController())

app.get("version") { request, response in
    response.send(json: ["version": "1.0"])
}

// MARK: Listen
app.listen(port: 80) { error in
  if error != nil {
    print("Error: \(error)")
  } else {
    print("Listening on port: \(app.port)")
  }
}
