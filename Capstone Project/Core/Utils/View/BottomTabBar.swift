//
//  BottomTabBar.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct BottomTabBar: View {
    @State var selection = 1

    let foodPresenter = FoodPresenter(categoryUseCase: Injection.init().provideCategory())
    let favoritePresenter = FavoritePresenter(favoriteUseCase: Injection.init().provideFavorite())
    let profilePresenter = ProfilePresenter(profileUseCase: Injection.init().provideProfile())

    var body: some View {
        TabView(selection: $selection) {
            NavigationView(content: {
                FoodsView()
            }
            ).tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(1)
            .environmentObject(foodPresenter)

            NavigationView(content: {
                FavoriteView()
            })
            .tabItem {
                Label("Favorite", systemImage: "heart.fill")
            }
            .tag(2)
            .environmentObject(favoritePresenter)

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
