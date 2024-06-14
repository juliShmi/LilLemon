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
                }.padding()
                FetchedObjects() { (dishes: [Dish]) in
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
