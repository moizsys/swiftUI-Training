//
//  Profile.swift
//  PresentationWork
//
//  Created by Moiz Amjad on 07/01/2024.
//

import SwiftUI

struct Profile: View {
    @State private var profilePicture: Image = Image(systemName: "person.circle.fill")
    @State private var firstName: String = "Aaban"
    @State private var lastName: String = "Tariq"

    var body: some View {
        VStack {
            Spacer()
            profilePicture
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)
                .padding()
            
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }

            }
            .padding()
            
            Spacer()
        }

    }
}

#Preview {
    Profile()
}
