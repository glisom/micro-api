import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let listController = ListController()
    router.get("list", List.parameter, use: listController.index)
    router.post("list", use: listController.create)
    router.delete("list", List.parameter, use: listController.delete)
    
    let songController = SongController()
    router.post("song", use: songController.create)
    router.get("song", List.parameter, use: songController.index)
    
}
