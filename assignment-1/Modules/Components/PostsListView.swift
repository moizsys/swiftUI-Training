////
////  PostsListView.swift
////  assignment-1
////
////  Created by Moiz Amjad on 24/12/2023.
////
//
//import SwiftUI
//
//struct PostsListView: View {
//    var imageName: String
//    var heading: String
//    var subheading: String
//    var time: String
//    
//    var body: some View {
//        HStack(alignment: .top, spacing: 10) {
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 80, height: 80)
//                .cornerRadius(8)
//            
//            VStack(alignment: .leading, spacing: 5) {
//                Text(heading)
//                    .font(.headline)
//                    .fontWeight(.bold)
//                
//                Text(subheading)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                
//                Spacer()
//                
//                Text(time)
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding(10)
//    }
//}
//
//struct Profile_Previews: PreviewProvider {
//    static var previews: some View {
//        PostsListView()
//    }
//}
