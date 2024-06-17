//
//  DishDetails.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 12/6/24.
//

import SwiftUI

struct DishDetails: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dish.image!)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            
            Text(dish.dishDescription!).padding()
                .font(.sectionTitle())
            Spacer()
        }
        .navigationTitle(dish.title!)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    DishDetails(dish: PersistenceController.getExampleDish())
}
