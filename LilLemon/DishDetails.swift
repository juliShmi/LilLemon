//
//  DishDetails.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 12/6/24.
//

import SwiftUI

struct DishDetails: View {
    let dish: Dish
    
    var body: some View {
        List {
            Text(dish.title!)
            Text(dish.price!)
            Text(dish.dishDescription!)
            //            AsyncImage(url: URL(string: dish.image ?? ""))
            //                            .frame(width: 100, height: 100)
            
        }.navigationTitle(dish.title!)
    }
}

#Preview {
    DishDetails(dish: Dish())
}
