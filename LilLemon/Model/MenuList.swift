//
//  MenuList.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
       // PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let urlRequest = URLRequest(url: url!)
        let downLoadTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let result =  try? decoder.decode(MenuList.self, from: data) {
                    for menuItem in result.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = menuItem.title
                        dish.id = menuItem.id
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                        dish.dishDescription = menuItem.description
                        dish.category = menuItem.category
                    }
                    try? viewContext.save()
                }
            }
        }
        downLoadTask.resume()
    }
}
