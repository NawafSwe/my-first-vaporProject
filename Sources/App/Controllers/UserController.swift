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
}


