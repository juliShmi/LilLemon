//
//  CustomToggle.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 17/6/24.
//

import SwiftUI


struct CustomToggleCheckMark: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(configuration.isOn ? Color("Primary1") : Color("Highlight2"))
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
    }
}

struct CustomToggleOrder: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(Color("Primary1"))
        .padding(5)
        .background {
            if configuration.isOn {
                Color("Highlight1")
            }
        }
        .cornerRadius(8)
    }
}
