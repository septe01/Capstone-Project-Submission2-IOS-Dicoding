//
//  FoodDetailView.swift
//  Food
//
//  Created by septe habudin on 08/01/23.
//

import SwiftUI
import SDWebImageSwiftUI


public struct FoodDetailView: View {
    @ObservedObject var presenter: FoodDetailPresenter

    public init(presenter: FoodDetailPresenter) {
        self.presenter = presenter
    }

    public var body: some View {
        ZStack {
            if presenter.loadingState {
                Text("Loading...")
            } else {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        VStack{
                            imageCategory
                        }
                        .frame(width: UIScreen.main.bounds.width - 32)

                        spacer
                        content
                        spacer
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle(Text(self.presenter.category.title), displayMode: .large)
            .onAppear(perform: {
                if self.presenter.category.id != "" {
                    self.presenter.isFavorite(category: self.presenter.category)
                }
            })
    }
}

extension FoodDetailView {
    var spacer: some View {
        Spacer()
    }

    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
        }
    }

    var imageCategory: some View {
        WebImage(url: URL(string: self.presenter.category.image))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 250.0, height: 250.0, alignment: .center)
    }


    var description: some View {
        Text(self.presenter.category.description)
            .font(.system(size: 15))
    }

    var favorite: some View {
        Image(systemName: self.presenter.favorite ? "heart.fill" : "heart")
            .font(.headline)
            .padding([.leading, .trailing])
            .onTapGesture {
                self.presenter.favorite ?self.presenter.delFavorite(category: self.presenter.category)  : self.presenter.addFavorite(category: self.presenter.category)
            }
    }

    func headerTitle(_ title: String) -> some View {
        return Text(title)
            .font(.headline)
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                headerTitle(self.presenter.category.title)
                    .padding([.top, .bottom])
                Spacer()

                favorite
            }
            description
        }
    }
}
