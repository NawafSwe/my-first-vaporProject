import Fluent
import Vapor
//initing the controllers
func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    //adding to todo controller
    try app.register(collection: TodoController())
    try app.register(collection: UserController())
}
