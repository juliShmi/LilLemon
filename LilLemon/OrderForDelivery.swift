//
//  OrderForDelivery.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 15/6/24.
//

import SwiftUI

struct OrderForDelivery: View {
    
    @Binding var isStarters: Bool
    @Binding var isMains: Bool
    @Binding   var isDesserts: Bool
    @Binding  var isDrinks: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Order for delivery!").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack {
                Toggle("Starters", isOn: $isStarters)
                Toggle("Mains", isOn: $isMains)
                Toggle("Desserts", isOn: $isDesserts)
                Toggle("Drinks", isOn: $isDrinks)
            }.toggleStyle(.button)
        }
    }
}

#Preview {

    OrderForDelivery(isStarters: .constant(true), isMains: .constant(true), isDesserts: .constant(true), isDrinks: .constant(true))
}
