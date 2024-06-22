//
//  LoginView.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

struct SigninView: View {
    @StateObject var signer = SigninViewViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack(spacing: 24){
                    Text("Sign In")
                        .foregroundStyle(Color(.darkGray))
                        .font(.largeTitle)
                        .bold()
                        
                    if !signer.errorMessage.isEmpty {
                        Text(signer.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    InputLineView(text: $signer.email,
                                  title: "Email Address",
                                  placeholder: "name@gmail.com")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    
                    InputLineView(text: $signer.fullname,
                                  title: "Name Surname",
                                  placeholder: "Göknur Arıcan")
                    
                    
                    InputLineView(text: $signer.password,
                                  title: "Password",
                                  placeholder: "Enter password", 
                                  isSecuredField: true)
                

                    ButtonView(title: "Sign In") {
                                signer.signin()
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
            .onReceive(signer.$isSignedIn) { isSignedIn  in
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
