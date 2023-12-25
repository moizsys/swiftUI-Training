import SwiftUI

struct Profile: View {
    @State private var selectedSegment = 0
    @State private var isBottomSheetOpen = false
    @State private var isCongratsPopupActive = false


    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                    // Header
                HStack {
                    Button(action: {
                            // Handle left button action
                    }) {
                        Text("Settings")
                            .padding()
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                            // Handle right button action
                    }) {
                        Text("Logout")
                            .padding()
                            .foregroundColor(Color.white)
                    }
                }
                .navigationBarHidden(true)
                .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                
                    // Your main content goes here
                VStack {
                    Spacer()
                    Image("profileImg")
                        .padding(.top, 90)
                        .onTapGesture {
                            isBottomSheetOpen.toggle()
                        }
                        .sheet(isPresented: $isBottomSheetOpen) {
                            VStack(alignment: .center, content: {
                                Text("Drawer header")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text("Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation.")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                    .padding([.leading,.trailing], 30)
                                    .padding(.top, 4)
                                    .multilineTextAlignment(.center)
                            }).padding(.top, 40)
                            
                            Button(action: {
                                isCongratsPopupActive.toggle()
                            }) {
                                Text("Click Me")
                                    .frame(width: 320)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                                    .cornerRadius(40)
                                    .padding()
                            }
                            .fullScreenCover(isPresented: $isCongratsPopupActive) {
                                CongratsPopup()
                            }
//                            .padding()
                            
                            Text("Secondary Action")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 93/255, green: 176/255, blue: 117/255))
                                .multilineTextAlignment(.leading)

                            
                            Spacer()
                                .presentationDetents([.height(300), .medium])
                        }
//                    Spacer()
                }
                .padding()
                .frame(width: 400, height: 150)
                .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                
                Spacer()
                
                    // Separate VStack for the orange background
                VStack {
                    VStack{
                        Text("Victoria Robertson")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("A mantra goes here")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                    .padding(.top, 50)
                    
//                        Spacer()
                        
//                    .padding(-40)
                        // Segmented control
                    VStack {
                        Picker(selection: $selectedSegment, label: Text("")) {
                            Text("Posts").tag(0)
                            Text("Photos").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .frame(height: 60) // Adjust the height as needed
                        /*.background(Color(red: 232/255, green: 232/255, blue: 232/255))*/ // Use RGB values of #E8E8E8
                        .cornerRadius(30) // Adjust the corner radius as needed
                                          // List below the segmented control
                        List {
                            ForEach(0..<5) { index in
                                    // Replace the placeholder values with your actual data
                                ListCell(imageName: "profileImg", heading: "Header", subheading: "He'll want to use your yacht, and I don't want this thing smelling like fish. \(index + 1)", time: "12:34 PM")
                                    .listRowInsets(EdgeInsets())
                            }
                        }
                        .listStyle(PlainListStyle())
                        
                    }
                    .padding()
                    
//                    Spacer()
                }
//                .background(Color.orange)
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarHidden(true)
    }
}

struct ListCell: View {
    var imageName: String
    var heading: String
    var subheading: String
    var time: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
//            Text(time)
//                .font(.caption)
//                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text(heading)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(subheading)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
        .padding(10)
    }
}


struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
