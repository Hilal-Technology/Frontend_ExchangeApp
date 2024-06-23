//
//  TamponView.swift
//  ExchangeApp
//
//  Created by Hilal on 22.06.2024.
//

import Foundation
import SwiftUI

struct TamponView: View {
    @EnvironmentObject var userViewModel: UsersViewModel

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Sign In", destination: SigninView().environmentObject(userViewModel))
                NavigationLink("Log In", destination: LoginView().environmentObject(userViewModel))
            }
        }
    }
}

#Preview {
    TamponView()
        .environmentObject(UsersViewModel())
}
