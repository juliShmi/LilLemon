//
//  HomePage.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 12/6/24.
//

import SwiftUI

struct HomePage: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistence = PersistenceController.shared
    
    var body: some View {
        VStack {
            Header()
            Menu()
        }
    }
}

#Preview {
    HomePage()
}
