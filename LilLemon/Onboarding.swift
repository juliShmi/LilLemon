//
//  Onboarding.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 11/06/2024.
//

import SwiftUI

let keyFirstName = "keyFirstName"
let keyLastName = "keyLastName"
let keyEmail = "keyEmail"
let keyIsLoggedIn = "keyIsLoggedIn"
let keyPhoneNumber = "keyPhoneNumber"
let keyOrderStatus = "keyOrderStatus"
let keyPasswordChanges = "keyPasswordChanges"
let keySpecialOffers = "keySpecialOffers"
let keyNewsletter = "keyNewsletter"


struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var firstName = "";
    @State var lastName = "";
    @State var email = "";
    @State var phoneNumber = "";
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("First name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                TextField("E-Mail", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                TextField("Phone number", text: $phoneNumber)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                Button("Register") {
                    if (!firstName.isEmpty
                        && !lastName.isEmpty
                        && !email.isEmpty
                        && !phoneNumber.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: keyFirstName);
                        UserDefaults.standard.set(lastName, forKey: keyLastName);
                        UserDefaults.standard.set(email, forKey: keyEmail);
                        UserDefaults.standard.set(phoneNumber, forKey: keyPhoneNumber);
                        UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
                        UserDefaults.standard.set(true, forKey: keyOrderStatus)
                        UserDefaults.standard.set(true, forKey: keySpecialOffers)
                        UserDefaults.standard.set(true, forKey: keyPasswordChanges)
                        UserDefaults.standard.set(true, forKey: keyNewsletter)
                        isLoggedIn = true
                    }
                }.buttonStyle(ButtonStyleYellow())
            
                
            }.foregroundColor(.black)
                .font(.custom("Karla", size: 18))
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
