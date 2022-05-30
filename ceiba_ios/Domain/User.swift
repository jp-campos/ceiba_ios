//
//  User.swift
//  ceiba_ios
//
//  Created by juan.p.campos.duran on 29/05/22.
//

import Foundation



struct User: Decodable{
    
    let id: Int
    let name : String
    let phone: String
    let email: String
    
}


protocol UserGateWay{
    func getUsers() async -> [User]
    
}
