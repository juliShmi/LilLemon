//
//  Menu.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import SwiftUI
import CoreData

struct Menu: View {
    @State var searchField = ""
    @Environment(\.managedObjectContext) private var viewContext
    @State var menuShown = false
    @State var startSearch = false
    
    @State var isStarters = true
    @State var isMains = true
    @State var isDesserts = true
    @State var isDrinks = true
    
    func buildPredicate() -> NSCompoundPredicate {
        let starters = !isStarters ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !isMains ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !isDesserts ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !isDrinks ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [starters, mains, desserts, drinks])
        return compoundPredicate
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Hero()
                    Button {
                        startSearch.toggle()
                    } label: {
                        Image(systemName:  "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.black, .gray)
                    }
                    if startSearch {
                        TextField("Search menu", text: $searchField)
                            .textFieldStyle(.roundedBorder)
                    }
                    OrderForDelivery(isStarters: $isStarters, isMains: $isMains, isDesserts: $isDesserts, isDrinks: $isDrinks)
                }.padding()
                FetchedObjects(predicate: buildPredicate()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            NavigationLink(destination: DishDetails(dish: dish)) {
                                DishItem(dish: dish)
                            }
                        }
                    }
                }
                .listStyle(.grouped)
            }
            
        }.onAppear {
            if(!menuShown) {
                MenuList.getMenuData(viewContext: viewContext)
                menuShown = true
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    Menu()
}
