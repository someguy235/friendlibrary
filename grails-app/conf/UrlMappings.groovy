class UrlMappings {
  static mappings = {
    "/$controller/$action?/$id?"{
      constraints {
        // apply constraints here
      }
    }
    "/"(controller:'index', action:'index')
    "/index.gsp"(controller:'index', action:'index')
    //"/login/auth"(controller:'index', action:'index')
    "/search"(controller:'search', action:'search')
    "/info"(view:'/info')
    "500"(view:'/error')
  }
}
