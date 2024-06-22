//
//  TotalUserModel.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import Foundation

import SwiftUI

class TotalUserModel: ObservableObject {
    @Published var TotalUsers: [String: UserModel] = [:]
    
    func addUser(name: String, surname: String, email: String, password: String, dolar: Double, turkish: Double) {
        let user = UserModel(name: name, surname: surname, email: email, password: password, dolar: dolar, turkish: turkish)
        TotalUsers[user.email] = user
    }
    
    func printUsers() {
           print("Total Users:")
           for (email, user) in TotalUsers {
               print("- Email: \(email), Name: \(user.name), Surname: \(user.surname)" , " Password: \(user.password)")
           }
       }
}
