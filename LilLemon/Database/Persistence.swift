//
//  Persistence.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ExampleDatabase")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: {_,_ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func clear() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
    }
    
    static func getExampleDish() -> Dish {
        let dish = Dish(context: shared.container.viewContext)
        dish.id = UUID()
        dish.title = "Bruschetta"
        dish.price = "10"
        dish.category = "starters"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true"
        dish.dishDescription = "Oven-baked bruschetta stuffed with tomatos and herbs."
        return dish;
    }
}
