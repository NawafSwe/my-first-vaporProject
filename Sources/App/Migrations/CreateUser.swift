//
//  CreateUser.swift
//  
//
//  Created by Nawaf B Al sharqi on 16/10/2020.
//

import Fluent
struct CreateUser : Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        //giving the name of the collection 'users'
        return database.schema("users")
            //specifying the schema of the user where user has id , username , password , email
            .id()
            .field("username", .string, .required)
            .field("password", .string, .required)
            .field("email", .string , .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("users").delete()
    }
    
    
}

