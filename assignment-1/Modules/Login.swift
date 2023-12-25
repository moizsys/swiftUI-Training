//
//  Login.swift
//  assignment-1
//
//  Created by Moiz Amjad on 19/12/2023.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var LoginEmail = ""
    @State private var LoginPass = ""
    @State private var isPasswordVisible = false
    @State private var password = ""
    
    var body: some View {
        NavigationView {
                // Your login screen view
            VStack {
                    // Header
                HStack {
                    Spacer()
                    Text("Log in")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
                    //            .padding()
                VStack {
                    
                    TextField("Eamil", text: $LoginEmail)
                        .frame(height: 55)
                        .padding([.horizontal], 4)
                        .padding(4)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(white: 0.85)))
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(white: 0.95))
                        )
                    Spacer().frame(height: 20)
                    
                    
                    
                    ZStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .frame(height: 55)
                                .padding([.horizontal], 4)
                                .padding(4)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(white: 0.85)))
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(white: 0.95))
                                )
                        } else {
                            SecureField("Password", text: $password)
                                .frame(height: 55)
                                .padding([.horizontal], 4)
                                .padding(4)
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(white: 0.85)))
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(white: 0.95))
                                )
                        }
                        
                            // Show/Hide Button
                        HStack {
                            Spacer()
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Text(isPasswordVisible ? "Hide" : "Show")
                                    .foregroundColor(Color(red: 93/255, green: 176/255, blue: 117/255))
                                    .padding(.trailing)
                            }
                        }
                    }
                    
                    Spacer().frame(height: 20)
                    
                    
                    Button(action: {
                    }) {
                        NavigationLink(destination: Profile()) {
                            Text("Log In")
                                .frame(width: 320)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                                .cornerRadius(40)
                                .padding()
                        }
                    }
                    .padding()
                    
                    Text("Forgot your password?")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 93/255, green: 176/255, blue: 117/255))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
