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
    @State private var fullname = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                
                VStack(spacing: 24){
                    Text("Sign In")
                        .foregroundStyle(Color(.darkGray))
                        .font(.largeTitle)
                        .bold()
                        
                    
                    InputLineView(text: $email,
                                  title: "Email Address",
                                  placeholder: "name@gmail.com")
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                    
                    InputLineView(text: $fullname,
                                  title: "Full Name",
                                  placeholder: "Göknur Arıcan")
                    
                    
                    InputLineView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter password", 
                                  isSecuredField: true)
                

                    ButtonView(title: "Sign In")
                    
                    Button{
                      dismiss()
                    } label: {
                        HStack(spacing: 3){
                            Text("Already have an account?")
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
    SigninView()
}
