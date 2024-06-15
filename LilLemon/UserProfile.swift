//
//  UserProfile.swift
//  LilLemon
//
//  Created by Iuliia Shmitko on 12/6/24.
//

import SwiftUI

struct UserProfile: View {
    
    @State var firstName = UserDefaults.standard.string(forKey: "keyFirstName") ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: "keyLastName") ?? ""
    @State var email = UserDefaults.standard.string(forKey: "keyEmail") ?? ""
    @State var phoneNumber = UserDefaults.standard.string(forKey: "keyPhoneNumber") ?? ""
    
    @State var orderStatus = UserDefaults.standard.bool(forKey: "keyOrderStatus")
    @State var passwordChanges = UserDefaults.standard.bool(forKey: "keyPasswordChanges")
    @State var specialOffers = UserDefaults.standard.bool(forKey: "keySpecialOffers")
    @State var newsletter = UserDefaults.standard.bool(forKey: "keyNewsletter")
    @State var isLoggedOut = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .leading) {
            Section("Personal information") {
                HStack {
                    Image("profile-image-placeholder")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.yellow, lineWidth: 2))
                        .frame(width: 150, height: 150)
                    Button("Change") {}.buttonStyle(.bordered)
                    Button("Remove"){}.buttonStyle(.bordered)
                }
            }
            Section("Name") {
                TextField("First name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
            }
            Section("Last name") {
                TextField("Last name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
            }
            Section("E-Mail") {
                TextField("E-Mail", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            Section("Phone number") {
                TextField("Phone number", text: $phoneNumber)
                    .textFieldStyle(.roundedBorder)
            }
            Spacer()
            Section("Email notifications") {
                Toggle("Order Statuses", isOn: $orderStatus)
                    .toggleStyle(CheckToggleStyle())
                Toggle("Password changes", isOn: $passwordChanges)
                    .toggleStyle(CheckToggleStyle())
                Toggle("Special offers", isOn: $specialOffers)
                    .toggleStyle(CheckToggleStyle())
                Toggle("Newsletter", isOn: $newsletter)
                    .toggleStyle(CheckToggleStyle())
            }.font(.custom("Markazi text", fixedSize: 18))
            Spacer()
            Section {
                VStack {
                    Button("Log out") {
                        UserDefaults.standard.set(false, forKey: "keyIsLoggedIn")
                        isLoggedOut = true
                    }
                    .buttonStyle(.borderedProminent)
                    .navigationDestination(isPresented: $isLoggedOut) {
                        Onboarding().navigationBarHidden(true)
                    }
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
                    HStack {
                        Button("Discard changes") {
                            firstName = UserDefaults.standard.string(forKey: "keyFirstName") ?? ""
                            lastName = UserDefaults.standard.string(forKey: "keyLastName") ?? ""
                            email = UserDefaults.standard.string(forKey: "keyEmail") ?? ""
                            phoneNumber = UserDefaults.standard.string(forKey: "keyPhoneNumber") ?? ""
                            
                            orderStatus = UserDefaults.standard.bool(forKey: "keyOrderStatus")
                            passwordChanges = UserDefaults.standard.bool(forKey: "keyPasswordChanges")
                            specialOffers = UserDefaults.standard.bool(forKey: "keySpecialOffers")
                            newsletter = UserDefaults.standard.bool(forKey: "keyNewsletter")
                        }.buttonStyle(.bordered)
                        Button("Save changes") {
                            UserDefaults.standard.set(firstName, forKey: keyFirstName);
                            UserDefaults.standard.set(lastName, forKey: keyLastName);
                            UserDefaults.standard.set(email, forKey: keyEmail);
                            UserDefaults.standard.set(phoneNumber, forKey: keyPhoneNumber);
                            UserDefaults.standard.set(orderStatus, forKey: keyOrderStatus)
                            UserDefaults.standard.set(specialOffers, forKey: keySpecialOffers)
                            UserDefaults.standard.set(passwordChanges, forKey: keyPasswordChanges)
                            UserDefaults.standard.set(newsletter, forKey: keyNewsletter)
                        }.buttonStyle(.borderedProminent)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    UserProfile()
}

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(configuration.isOn ? Color.green : .green)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}
