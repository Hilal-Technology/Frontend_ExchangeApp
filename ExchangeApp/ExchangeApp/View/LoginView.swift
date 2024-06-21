//
//  LoginView.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack(spacing: 24){
                    Text("Login")
                        .foregroundStyle(Color(.darkGray))
                        .font(.largeTitle)
                        .bold()
                    
                    
                    InputLineView(text: $email,
                                  title: "Email Address",
                                  placeholder: "name@gmail.com")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    
                    InputLineView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter password",
                                  isSecuredField: true)
                    
                    //Sign in button
    
                    ButtonView(title: "Login")
                    
                    NavigationLink{
                        SigninView()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        HStack(spacing: 3){
                            Text("New member?")
                            Text("Sign In")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
               
            }
        }
    }
}


#Preview {
    LoginView()
}
