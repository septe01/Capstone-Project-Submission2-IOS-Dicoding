//
//  FoodDetailView.swift
//  Capstone Project
//
//  Created by septe habudin on 10/12/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct FoodDetailView: View {
    @ObservedObject var presenter: FoodDetailPresenter

    var body: some View {
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
        }.navigationBarTitle(Text(self.presenter.category.title), displayMode: .large)
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

    func headerTitle(_ title: String) -> some View {
        return Text(title)
            .font(.headline)
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            headerTitle("Description")
                .padding([.top, .bottom])
            description
        }
    }
}


struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {

        let food = CategoryModel(
            id: "1",
            title: "Meat Max Pizza",
            image: "https://imgur.com/U9eNM7y.png",
            description: "Dengan Jamur, Baked Beans, Beef Rashers, Telur, Saus Tomat dan Cream Mayo, serta Sosis Ayam di pinggirannya",
            isFavorite: false

        )

        FoodDetailView(presenter: FoodDetailPresenter(categoryDetailUseCase: Injection.init().provideDetailCategory(category: food)))
    }
}
