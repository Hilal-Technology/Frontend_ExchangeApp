//
//  LoginView.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user : UsersViewModel
    @State private var navigateToHome = false
        
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack(spacing: 24){
                    Text("Login")
                        .foregroundStyle(Color(.darkGray))
                        .font(.largeTitle)
                        .bold()
                    
                    if !user.errorMessage.isEmpty {
                        Text(user.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    InputLineView(text: $user.email,
                                  title: "Email Address",
                                  placeholder: "name@gmail.com")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    
                    InputLineView(text: $user.password,
                                  title: "Password",
                                  placeholder: "Enter password",
                                  isSecuredField: true)
                    
                    //Sign in button
                    
                    ButtonView(title: "Login") {
                        user.login()
                    }
                    
                    NavigationLink(destination: SigninView().navigationBarBackButtonHidden(true)) {
                        HStack(spacing: 3) {
                            Text("New member?")
                            Text("Sign In")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
            }
            
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
            .onReceive(user.$isLogedIn) { isLogedIn in
                if isLogedIn {
                    navigateToHome = true
                }
            }
        }
    }
}


#Preview {
    LoginView()
}
