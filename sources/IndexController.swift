import Foundation

import Blackfish
import BlackfishStencil
import Orca
import OrcaMongoDB

public class IndexController: Controller {
  public func routes(router: Router) {
    router.get("/", handler: index)
    router.get("/features", handler: features)
    router.get("/about", handler: about)

    let mongo = OrcaMongoDB()
    mongo.connect(host: "ds11258.mlab.com", port: 11258, database: "blackfish") { error in
      if error != nil {
        print(error)
      }
    }
    let database = Orca(driver: mongo)
    PhoneApp.findAll() { ([models], error) in
      if error == nil {
        for model in models {
          print(model.name)
        }
      } else {
        print(error)
      }
    }
  }

  func index(request: Request, response: Response) {
    response.render("Templates/index.mustache", data: [
      "siteTitle": "NordicArts",
    ])
  }

  func features(request: Request, response: Response) {
    response.render("Templates/index.mustache", data: [
      "siteTitle": "NordicArts ..:::.. Features",
      "featuresPage": true,
    ])
  }

  func about(request: Request, response: Response) {
    response.render("Templates/index.mustache", data: [
      "siteTitle": "NordicArts ..::.. About",
      "aboutPage": true,
    ])
  }
}
