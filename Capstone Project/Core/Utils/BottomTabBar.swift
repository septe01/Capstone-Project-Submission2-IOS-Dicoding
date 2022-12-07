//
//  BottomTabBar.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct BottomTabBar: View {
    @State var selection = 1

    var body: some View {
            TabView(selection: $selection) {
                FoodsView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(1)

                FavoriteView()
                    .tabItem {
                        Label("Favorite", systemImage: "heart.fill")
                    }
                    .tag(2)

                AboutView()
                    .tabItem {
                        Label("About", systemImage: "person.crop.circle.fill")
                    }
                    .tag(3)
            }
            .accentColor(Color("ColorGreyDark"))
            .navigationTitle(selection == 1 ? "Games" : selection == 2 ? "Favorite" : "About")
            .navigationBarTitleDisplayMode(.inline)
        }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}
