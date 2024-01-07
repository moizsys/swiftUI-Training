//
//  TabView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 20/11/2023.
//

import SwiftUI
import UIKit

struct SettingViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return SettingsViewController()

    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // Update the view controller if needed
    }
}

struct StudentTabView: View {
    @State var selectedIndex = 0
    @State var showMenu = false
    var body: some View {
        VStack {            
            ZStack {
                TabView(selection: $selectedIndex) {
                    ListView(showMenu: $showMenu)
                        .tabItem { Text("Students") }
                        .tag(0)
                    SettingViewController() // Use the UIViewControllerRepresentable here
                        .tabItem { Text("Settings") }
                        .tag(1)
                }
                SideMenu(isShowing: $showMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedIndex, presentSideMenu: $showMenu)))
            }

        }
    }
}

#Preview {
    StudentTabView()
}
