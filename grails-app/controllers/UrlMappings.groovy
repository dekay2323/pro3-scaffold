

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'flow1', action:'home')
        "/controllers"(view:"/controllers")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
