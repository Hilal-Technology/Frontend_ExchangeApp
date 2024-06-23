//
//  SigninViewViewModel.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import Foundation
import SwiftUI

class SigninViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var errorMessage = ""
    @Published var isSignedIn = false
    @ObservedObject var userViewModel = UsersViewModel()
    
    init(email: String = "", password: String = "", fullname: String = "") {
        self.email = email
        self.password = password
        self.fullname = fullname
    }
    
    
    func signin(){
        guard validate() else {
            return
        }
        
        let components = fullname.components(separatedBy: " ")
        let name = components.first ?? ""
        let surname = components.dropFirst().joined(separator: " ")
              
        userViewModel.addUser(name: name,
                              surname: surname,
                              email: email,
                              password: password,
                              dolar: 0.0,
                              turkish: 0.0)
        
        
        isSignedIn = true
        print("Signed")
        userViewModel.printUsers()
        clearFields()
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard userViewModel.TotalUsers[email] == nil else {
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
