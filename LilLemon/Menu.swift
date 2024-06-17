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
    
    @State var isStarters = true
    @State var isMains = true
    @State var isDesserts = true
    @State var isDrinks = true
    
    @State var startSearch = false
    @State var searchField = ""
    
    func buildPredicate() -> NSCompoundPredicate {
        let starters = !isStarters ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !isMains ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !isDesserts ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !isDrinks ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        let search = searchField.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchField)
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [starters, mains, desserts, drinks, search])
        return compoundPredicate
    }
    
    func buildSortdescriptions() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Hero().frame(maxHeight: 200)
                    Button {
                        startSearch.toggle()
                    } label: {
                        Image(systemName:  "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.black, .gray)
                    }.padding(.horizontal)
                    if startSearch {
                        TextField("Search menu", text: $searchField)
                            .textFieldStyle(.roundedBorder)
                            .onDisappear() {
                                searchField = ""
                            }
                    }
                    OrderForDelivery(isStarters: $isStarters, isMains: $isMains, isDesserts: $isDesserts, isDrinks: $isDrinks)
                }
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortdescriptions()) { (dishes: [Dish]) in
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
