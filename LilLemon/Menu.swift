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
                List{
                    ForEach(dishes) {dish in
                        HStack {
                            Text(dish.title ?? "title")
                            Text(dish.price ?? "price")
                            Text(dish.dishDescription ?? "description")
                            AsyncImage(url: URL(string: dish.image ?? ""))
                                    .frame(width: 100, height: 100)
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
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
