//
//  FavoriteView.swift
//  Favorite
//
//  Created by septe habudin on 08/01/23.
//

import SwiftUI
import Food

public struct FavoriteView: View {

    @EnvironmentObject var favoritePresenter: FavoritePresenter

    public init() {}

    public var body: some View {
        ZStack {
            if favoritePresenter.loadingState {
                VStack {
                    Text("Loading...")
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(
                        self.favoritePresenter.favorites,
                        id: \.id
                    ) { favorite in
                        ZStack {

                            self.favoritePresenter.linkBuilder(for: favorite) {
                                FoodRow(category: favorite)
                            }.buttonStyle(PlainButtonStyle())

                        }.padding(8)
                    }
                }
            }
        } .onAppear(perform: {
            self.favoritePresenter.getFavorites()
        })
        .navigationBarTitle(
            Text("Favorite"),
            displayMode: .automatic
        )
    }
}
