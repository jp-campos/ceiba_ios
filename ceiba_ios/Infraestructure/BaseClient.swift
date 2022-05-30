//
//  BaseClient.swift
//  ceiba_ios
//
//  Created by juan.p.campos.duran on 29/05/22.
//

import Foundation




class BaseClient{
    
    private let basePath = "https://jsonplaceholder.typicode.com/"
    
    func makeRequest(_ path:String) async throws -> Data?{
        
        
        async let (userData, _) = URLSession.shared.data(from: URL(string: basePath + path)!)
        return try? await userData
       
    }

}
