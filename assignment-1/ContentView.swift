//
//  ContentView.swift
//  assignment-1
//
//  Created by Moiz Amjad on 18/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isAccepted = false
    @State private var isPasswordVisible = false
    @State private var isLoggedIn = false // Track the login state
    
    
    var body: some View {
        NavigationView{
            VStack {
                    // Header
                HStack {
                    Image("crossIcon")
                        .padding()
                    Spacer()
                    Text("Sign up")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    Spacer()
                    Button(action: {
                        isLoggedIn.toggle()
                    }) {
                        NavigationLink(destination: LoginView()) {
                            
                            Text("Login")
                                .padding()
                                .foregroundColor(Color(red: 93/255, green: 176/255, blue: 117/255))
                        }
                    }
                }
                .navigationBarBackButtonHidden(true) // Hide the default back button
                .navigationBarHidden(true)
                                
                VStack {
                        // Login Form
                    TextField("Name", text: $username)
                        .frame(height: 55)
                        .padding([.horizontal], 4)
                        .padding(4)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(white: 0.85)))
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(white: 0.95))
                        )
                    
                    Spacer().frame(height: 20)
                    
                    TextField("Email", text: $email)
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
                    HStack(alignment: .top){
                        Button(action: {
                            isAccepted.toggle()
                        }) {
                            Image(systemName: isAccepted ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isAccepted ? .blue : .gray)
                            
                            Text("I would like to receive your newsletter and other promotional information.")
                                .font(.system(size: 14))
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding(4)
                    }
                    
                    
                    Button(action: {
                    }) {
                        Text("Sign Up")
                            .frame(width: 320)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                            .cornerRadius(40)
                            .padding()
                    }
                    .padding()
                    
                    Text("Forgot your password?")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.leading)
                    
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}


