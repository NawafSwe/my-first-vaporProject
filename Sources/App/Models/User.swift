//
//  User.swift
//  
//
//  Created by Nawaf B Al sharqi on 16/10/2020.
//

import Fluent
import Vapor
//creating the user model and make it confirm to the protocols Model , Content
final class User : Model,Content{
    static let schema: String = "users"
    var id : UUID?
    
    @Field(key: "username")
    var username : String
    @Field(key:"password")
    var password : String
    @Field(key: "email")
    var email: String
    init(){}
    
    //initing the user constructor
    init(id: UUID , username : String , password : String , email: String ) {
        self.id = id
        self.username = username
        self.password = password
        self.email = email
    }
}

