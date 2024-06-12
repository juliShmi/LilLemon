//
//  MenuItem.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title : String
    let description: String
    let price: String
    let image: String
    let category: String
}
