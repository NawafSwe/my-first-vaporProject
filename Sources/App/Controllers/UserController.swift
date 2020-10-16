//
//  UserController.swift
//  
//
//  Created by Nawaf B Al sharqi on 16/10/2020.
//
import Fluent
import Vapor
struct UserController : RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        //telling that the route path is /users
        let users : RoutesBuilder =  routes.grouped("users")
        //specifying the routes and their functions
        users.get(use: index)
        users.post(use: create)
        users.group(":id"){ user in
            user.delete(use:delete)
            user.put(use:update)
            
        }
    }
    //index for getting all users  --> /users
    func index(req : Request) throws -> EventLoopFuture<[User]>{
        return User.query(on: req.db).all()
    }
    
    //creating the user
    func create(req: Request)throws -> EventLoopFuture<User>{
        //decoding the data from json object to UserModel
        let user = try req.content.decode(User.self)
        //saving the user model into the database and returns its info
        //print user
        print(user)
        return user.save(on: req.db).map({user})
    }
    
    //delete user
    func delete(req : Request) throws -> EventLoopFuture<HTTPStatus>{
        return User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap({$0.delete(on: req.db)})
            .transform(to: .ok)
    }
    
    //update user info
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus>{
        return User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap({$0.update(on: req.db)})
            .transform(to: .ok)
    }
    
   
}


