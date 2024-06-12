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
            TabView {
                Menu()
                    .environment(\.managedObjectContext, persistence.container.viewContext)
                    .tabItem { Label("Menu", systemImage: "list.dash") }
                UserProfile()
                    .tabItem { Label("Profile", systemImage: "square.and.pencil") }
            }.navigationBarBackButtonHidden()
        }
    }

#Preview {
    HomePage()
}
