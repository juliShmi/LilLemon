//
//  DishItem.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 12/6/24.
//

import SwiftUI

struct DishItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dish.title!).font(.title2)
            HStack {
                VStack(alignment: .leading){
                    Text("$\(dish.price!)")
                    Text(dish.dishDescription!)
                }
                
                Spacer()
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Rectangle())
                .frame(maxWidth: 100, maxHeight: 50)
            }
        }
    }
}

#Preview {
    DishItem(dish: PersistenceController.getExampleDish())
}
