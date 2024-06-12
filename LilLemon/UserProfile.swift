//
//  UserProfile.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 12/6/24.
//

import SwiftUI

struct UserProfile: View {
        let firstName = UserDefaults.standard.string(forKey: "keyFirstName") ?? ""
        let lastName = UserDefaults.standard.string(forKey: "keyLastName") ?? ""
        let email = UserDefaults.standard.string(forKey: "keyEmail") ?? ""
        
        @Environment(\.presentationMode) var presentation

        var body: some View {
            VStack {
               Text("Personal information")
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFit()
                Text(firstName)
                Text(lastName)
                Text(email)
                Button("Logout") {
                    UserDefaults.standard.set(false, forKey: "keyIsLoggedIn")
                    self.presentation.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
}

#Preview {
    UserProfile()
}
