//
//  InputLineView.swift
//  ExchangeApp
//
//  Created by Hilal on 21.06.2024.
//

import SwiftUI

struct InputLineView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecuredField = false
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 12){
            Text(title)
                .foregroundStyle(Color(.darkGray))
                            .font(.footnote)
                            .fontWeight(.semibold)
            
            if isSecuredField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 18))
            }else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 18))
            }
            Divider()
        }
    }
}

    struct InputLineView_Previews: PreviewProvider {
        static var previews: some View {
            InputLineView(text: .constant(""), title: "Email Address", placeholder: "name@gmail.com" )
        }
    }
        
