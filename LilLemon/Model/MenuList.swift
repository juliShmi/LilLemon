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
            PersistenceController.shared.clear()
            let serverURLString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
            let url = URL(string: serverURLString)
            guard let url = url else {
                print("Invalid server URL")
                return
            }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let menuList = try decoder.decode(MenuList.self, from: data)
                            
                        for menuItem in menuList.menu {
                            let dish = Dish(context: viewContext)
                            dish.title = menuItem.title
                            dish.price = menuItem.price
                            dish.image = menuItem.image
                            dish.dishDescription = menuItem.description
                            dish.category = menuItem.category
                            dish.id = menuItem.id
                        }
                        try? viewContext.save()
                    } catch {
                        print("Error decoding menu data: \(error)")
                    }
                }
            }
            task.resume()
        }
}
