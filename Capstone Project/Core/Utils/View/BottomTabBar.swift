//
//  BottomTabBar.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct BottomTabBar: View {
    @State var selection = 1

    let profilePresenter = ProfilePresenter(profileUseCase: Injection.init().provideProfile())

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
                    .environmentObject(profilePresenter)
            }
            .accentColor(Color("ColorGreyDark"))
        }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}
