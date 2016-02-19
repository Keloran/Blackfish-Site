import Foundation

import Blackfish
import BlackfishStencil

public class IndexController: Controller {
  public func routes(router: Router) {
    router.get("/", handler: index)
    router.get("/features", handler: features)
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
}
