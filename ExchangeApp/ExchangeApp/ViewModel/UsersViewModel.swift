//
//  UsersViewModel.swift
//  ExchangeApp
//
//  Created by Hilal on 23.06.2024.
//

import Foundation

import SwiftUI

@MainActor
class UsersViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var errorMessage = ""
    @Published var isSignedIn = false
    @Published var isLogedIn = false
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
    
    func signin() {
        
        guard validate_signin() else {
            clearFields()
            return
        }
        
        let components = fullname.components(separatedBy: " ")
        let name = components.first ?? ""
        let surname = components.dropFirst().joined(separator: " ")
        
        
        if TotalUsers[email] == nil {
            let newUser = UserModel(name: name, surname: surname, email: email, password: password, dolar: 0.0, turkish: 0.0)
            TotalUsers[email] = newUser
            errorMessage = "Sign in successful!"
            isSignedIn = true
            
            print("Signed")
            printUsers()
            clearFields()
            
            return
        }
        return
    }
    
    func login() {
        
        guard validate_login() else {
            clearFields()
            return
        }
        
        print("Login view")
        printUsers()
        
        if let user = TotalUsers[email], user.password == password {
            errorMessage = "Login successful!"
            isLogedIn = true
            return
        }
        
        errorMessage = "Wrong entry."
        clearFields()
        return
    }
    
    func validate_login() -> Bool {
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email address."
            return false
        }
        
        return true
    }
    
    func validate_signin() -> Bool {
        errorMessage = ""
        
        guard TotalUsers[email] == nil else {
            errorMessage = "A user with this email already exists."
            return false
        }
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !fullname.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email address."
            return false
        }
        
        guard fullname.contains(" ") else {
            errorMessage = "Please enter both first name and last name."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }
        
        return true
    }
    
    private func clearFields() {
        email = ""
        password = ""
        fullname = ""
    }
}
