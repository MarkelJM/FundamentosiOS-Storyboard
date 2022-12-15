//
//  LocalDataLayer.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 15/12/22.
//

import Foundation

final class LocalDataLayer{
    
    private static let token = "token"
    static let shared = LocalDataLayer()
    
    func save(token : String){
        UserDefaults.standard.set(token, forKey: Self.token)
    }
    
    func getToken()-> String {
        UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
    func isUserLogger()-> Bool{
        return !getToken().isEmpty
    }
    
}
