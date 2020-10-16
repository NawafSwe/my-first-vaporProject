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
        users.get("users", use: index)
        
        
    }
    
    //index for getting all users  --> /users
    func index(req : Request) throws -> EventLoopFuture<[User]>{
        return User.query(on: req.db).all()
    }
    
    func create(req: Request)throws -> EventLoopFuture<User>{
        //decoding the data from json object to UserModel
        let user = try req.content.decode(User.self)
        //saving the user model into the database and returns its info 
        return user.save(on: req.db).map({user})
    }
}


