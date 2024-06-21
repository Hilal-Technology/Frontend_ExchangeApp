//
//  OpeningView.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import SwiftUI

struct OpeningView: View {
    @State private var isActive = false
    var body: some View {
        if(isActive){
            LoginView()
        }else{
            ZStack{
                Color("lightorange")
                    .ignoresSafeArea()
                
                Circle()
                    .scale(0.80)
                    .foregroundStyle(Color(.white.opacity(0.15)))
                    .offset(x:-100 , y: -300)
                Circle()
                    .scale(0.60)
                    .foregroundStyle(Color(.white.opacity(0.3)))
                    .offset(x:80 , y: -200 )
                
                Circle()
                    .scale(1.20)
                    .foregroundStyle(Color(.white.opacity(0.2)))
                    .offset(x:-50 , y: 200)
                Circle()
                    .scale(0.50)
                    .foregroundStyle(Color(.white.opacity(0.1)))
                    .offset(x: 150 , y: 300)
                VStack{
                    Text("ExchangeApp")
                        .foregroundStyle(Color(Color.white))
                        .font(.largeTitle)

                        .bold()
                }
            }
            
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    OpeningView()
}
