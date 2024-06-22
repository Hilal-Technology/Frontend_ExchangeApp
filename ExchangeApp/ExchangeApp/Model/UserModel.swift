//
//  UserModel.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import Foundation

struct UserModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var surname: String
    var email: String
    var password: String
    var dolar: Double
    var turkish: Double
    
    func getPassword() -> String {
            return password
        }
    
}





