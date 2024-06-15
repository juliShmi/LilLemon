//
//  OrderForDelivery.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 15/6/24.
//

import SwiftUI

struct OrderForDelivery: View {
    
    //starters, mains, desserts, drinks
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
//
//#Preview {
//    @State var isStarters = true
//    @State var isMains = true
//     @State   var isDesserts = true
//      @State  var isDrinks = true
//    OrderForDelivery(isStarters: $isStarters, isMains: $isMains, isDesserts: $isDesserts, isDrinks: $isDrinks)
//}
