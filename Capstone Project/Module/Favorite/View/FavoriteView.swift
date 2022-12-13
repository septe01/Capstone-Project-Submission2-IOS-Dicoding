//
//  FavoriteView.swift
//  Capstone Project
//
//  Created by septe habudin on 07/12/22.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    
    var body: some View {
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

struct FavoriteView_Previews: PreviewProvider {
    static let favoritePresenter = FavoritePresenter(favoriteUseCase: Injection.init().provideFavorite())
    
    static var previews: some View {
        FavoriteView().environmentObject(favoritePresenter)
    }
}
