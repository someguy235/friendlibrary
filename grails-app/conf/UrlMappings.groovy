class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"home", action:"index")
		"500"(view:'/error')

    /*
    "/service/$controller/$id?"{
      action = [GET: "list", POST: "save"]

      constraints {
        
      }
    }
    */
    // web service stuff
//    "library/$id?.json"(resource:"library")

	}
}
