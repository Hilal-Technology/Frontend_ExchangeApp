//
//  ExchangeAppApp.swift
//  ExchangeApp
//
//  Created by Hilal on 17.06.2024.
//

import SwiftUI

@main
struct ExchangeAppApp: App {
    @StateObject private var userViewModel = UsersViewModel()

    var body: some Scene {
        WindowGroup {
            OpeningView()
                .environmentObject(userViewModel)
        }
    }
}
