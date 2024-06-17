//
//  CustomButton.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 16/6/24.
//

import SwiftUI



struct ButtonStyleYellow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color("Primary1") : Color("Primary2"))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color("Primary1") : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color("Primary1"))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("Primary1"), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color("Primary1"))
            .padding(10)
            .background(configuration.isPressed ? Color("Primary1") : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("Primary1"), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}
