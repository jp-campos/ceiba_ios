//
//  UserApi.swift
//  ceiba_ios
//
//  Created by juan.p.campos.duran on 29/05/22.
//

import Foundation



class UserApi: UserGateWay{
    
    
    private let baseClient = BaseClient()
    
    func getUsers() async-> [User]  {
        let usersData =  try? await baseClient.makeRequest("users")
       
        do {
               let decoder = JSONDecoder()
            let users = try await decoder.decode([User].self, from: usersData!)
         
               return users
           } catch {
               print("Sorry, there was a network problem. \(error)")
           }
        
        return []
    }

    
    
}
