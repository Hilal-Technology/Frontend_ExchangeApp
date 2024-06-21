//
//  LoginView.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

struct SigninView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack(spacing: 24){
                    Text("Sign In")
                        .foregroundStyle(Color(.darkGray))
                        .font(.largeTitle)
                        .bold()
                        .padding(-50)
                    
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
    
                    ButtonView(title: "Sign In")
                    
                }
                .padding(.horizontal)
            }
        }
    }
}


#Preview {
    SigninView()
}
