//
//  ButtonView.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
                    Text(title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.white))
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .addBorder(Color.blue, width: 1, cornerRadius: 10)
                }
    }
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}

#Preview {
    ButtonView(title: "Sign In") {
            print("Clicked")
        }
}
