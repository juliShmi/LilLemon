//
//  Onboarding.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import SwiftUI

let keyFirstName = "keyFirstName";
let keyLastName = "keyLastName";
let keyEmail = "keyEmail"
let keyIsLoggedIn = "keyIsLoggedIn"


struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var firstName = "";
    @State var lastName = "";
    @State var email = "";
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("First name", text: $firstName)
                TextField("Last name", text: $lastName)
                TextField("E-Mail", text: $email)
                Button("Register") {
                    if (!firstName.isEmpty
                        && !lastName.isEmpty
                        && !email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: keyFirstName);
                        UserDefaults.standard.set(lastName, forKey: keyLastName);
                        UserDefaults.standard.set(email, forKey: keyEmail);
                        UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
                        isLoggedIn = true
                    }
                }
            }
            .padding()
            .onAppear {
                if UserDefaults.standard.bool(forKey: "keyIsLoggedIn") {
                        isLoggedIn = true
                    }
            }.navigationDestination(isPresented: $isLoggedIn) {
                HomePage()
            }
            .autocorrectionDisabled()
        }
    }
}

#Preview {
    Onboarding()
}
