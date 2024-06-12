//
//  Menu.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("This is a cute family restaurant with mediterranian food")
            
            FetchedObjects() { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        //                        NavigationLink(value: dish) {
                        //                            DishDetails(dish: dish)
                        //                        }
                        HStack {
                            Text(dish.title!)
                            Text(dish.price!)
                            Text(dish.dishDescription!)
                            AsyncImage(url: URL(string: dish.image!)) { result in
                                result.image?
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: 50, height: 50)
                        }
                    }
                }
            }
        }.onAppear {
            MenuList.getMenuData(viewContext: viewContext)
        }
    }
                           
}

#Preview {
    Menu()
}
