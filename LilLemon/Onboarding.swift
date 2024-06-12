//
//  Onboarding.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import SwiftUI

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
        }
    }
}

#Preview {
    Onboarding()
}
