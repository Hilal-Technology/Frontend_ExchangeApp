//
//  LoginView.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

struct SigninView: View {
    @Environment(\.dismiss) var dismiss
    @State private var navigateToHome = false
    @EnvironmentObject var user :  UsersViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack(spacing: 24){
                    Text("Sign In")
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
                    
                    InputLineView(text: $user.fullname,
                                  title: "Name Surname",
                                  placeholder: "Göknur Arıcan")
                    
                    
                    InputLineView(text: $user.password,
                                  title: "Password",
                                  placeholder: "Enter password", 
                                  isSecuredField: true)
                

                    ButtonView(title: "Sign In") {
                        user.signin()
                            }
                    
                    Button{
                      dismiss()
                    } label: {
                        HStack(spacing: 3){
                            Text("Already have an account?")
                            Text("Login")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
            }
            
            .navigationDestination(isPresented: $navigateToHome) {
                LoginView()
            }
            .onReceive(user.$isSignedIn) { isSignedIn  in
                if isSignedIn {
                    navigateToHome = true
                }
          }
        }
    }
}


#Preview {
    SigninView()
}
