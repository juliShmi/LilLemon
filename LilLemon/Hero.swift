//
//  Hero.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 14/6/24.
//

import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(.largeTitle)
            Text("Chicago")
                .font(.title2)
            HStack {
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Image("hero").resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: .continuous))
                
            }
        }
    }
}

#Preview {
    Hero()
}
