//
//  LoginView.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginer = LoginViewViewModel()
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
                    
                    if !loginer.errorMessage.isEmpty {
                        Text(loginer.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    InputLineView(text: $loginer.email,
                                  title: "Email Address",
                                  placeholder: "name@gmail.com")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    
                    InputLineView(text: $loginer.password,
                                  title: "Password",
                                  placeholder: "Enter password",
                                  isSecuredField: true)
                    
                    //Sign in button
                    
                    ButtonView(title: "Login") {
                        loginer.login()
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
            .onReceive(loginer.$isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    navigateToHome = true
                }
            }
        }
    }
}


#Preview {
    LoginView()
}
