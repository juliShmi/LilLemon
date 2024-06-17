//
//  Hero.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 14/6/24.
//

import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .font(.displayFont())
                    .foregroundStyle(Color("Primary2"))
                Text("Chicago")
                    .font(.subTitleFont())
                    .foregroundStyle(.white)
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.leadText())
                    Spacer()
                    Image("hero").resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous))
                }
            }.padding()
        }.background(Color("Primary1"))

        
    }
}

#Preview {
    Hero()
}
