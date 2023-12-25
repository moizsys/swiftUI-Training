//
//  CongratsPopup.swift
//  assignment-1
//
//  Created by Moiz Amjad on 24/12/2023.
//

import SwiftUI

struct CongratsPopup: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer() // Top Spacer
                
                VStack {
                    Spacer() // Spacer to push the content to the middle
                    
                    VStack(spacing: 0) {
                        Text("Congratulations!")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.")
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .padding([.leading, .trailing], 30)
                            .padding(.top, 12)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 20)
                    
                    Button(action: {
                            // Button action
                    }) {
                        NavigationLink(destination: RatePopup()){
                            Text("Click Me")
                                .frame(width: 280)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                                .cornerRadius(40)
                                .padding()
                        }
                        
                    }
                    
                    Text("Secondary Action")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 93/255, green: 176/255, blue: 117/255))
                        .multilineTextAlignment(.leading)
                    
                    Spacer() // Bottom Spacer
                }
                .background(
                    RoundedRectangle(cornerRadius: 20) // Adjust the corner radius as needed
                        .fill(Color.white)
                )
                .frame(height: 350)
                .padding(.horizontal, 40) // Add horizontal padding
                
                Spacer() // Spacer to push the content to the middle
            }
            .background(Color(red: 93/255, green: 176/255, blue: 117/255))
            .padding(.horizontal, 40) // Add horizontal padding
            .frame(maxHeight: .infinity) // Make the background fill the entire screen
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarHidden(true)

    }
        
}

#Preview {
    CongratsPopup()
}
