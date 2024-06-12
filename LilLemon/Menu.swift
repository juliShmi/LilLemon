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
    @State var menuShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Little Lemon")
                Text("Chicago")
                Text("This is a cute family restaurant with mediterranian food")
                
                FetchedObjects() { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            NavigationLink(destination: DishDetails(dish: dish)) {
                                DishItem(dish: dish)
                            }
                        }
                    }
                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
            
        }.onAppear {
            if(!menuShown) {
                MenuList.getMenuData(viewContext: viewContext)
                menuShown = true
            }
        }
    }
    
}

#Preview {
    Menu()
}
