//
//  Header.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 14/6/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                Image("LittleLemonHeader")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50)
                Spacer()
                NavigationLink(destination: UserProfile(), label: {
                    Image("profile-image-placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.yellow, lineWidth: 2))
                        .padding(.trailing)
                }
                )
            }
        }.padding(.bottom)
            .frame(maxHeight: 70)
         
    }
}

#Preview {
    Header()
}
