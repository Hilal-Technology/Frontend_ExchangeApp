//
//  LoginViewViewModel.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import Foundation
import SwiftUI

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    @ObservedObject var userViewModel = TotalUserModel()
    
    func login(){
        guard validate() else {
            return
        }
        
        let user = userViewModel.TotalUsers[email]
        /*
        if user == nil {
            errorMessage = "User not found."
            return
        }
          */
        
        //user nil olarak dönüyor anlayamadım
        
        if user?.getPassword() == password {
            errorMessage = "Login successful!"
            isLoggedIn = true
            
            } else {
                errorMessage = "Incorrect password."
            }

    }
    
    func validate() -> Bool {
        
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
    
}
