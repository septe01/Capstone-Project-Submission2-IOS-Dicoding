//
//  FoodRow.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodRow: View {
    var category: CategoryModel
    var body: some View {
        VStack(alignment: .leading) {
            imageCategory
            content
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 250)
        .background(Color.random.opacity(0.3))
        .cornerRadius(30)
    }
}

extension FoodRow {

    var imageCategory: some View {
            WebImage(url: URL(string: category.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 200)
                .cornerRadius(30)
                .padding(.top)
                .frame(width: UIScreen.main.bounds.width - 32)
    }

    var content: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10) {
                Text(category.title)
                    .font(.title)
                    .bold()

                Text(category.description)
                    .font(.system(size: 14))
                    .lineLimit(2)
            }.padding(
                EdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 16,
                    trailing: 16
                )
            )
        }

    }

}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        let food = CategoryModel(
            id: "1",
            title: "Meat Max Pizza",
            image: "https://imgur.com/U9eNM7y.png",
            description: "Dengan Jamur, Baked Beans, Beef Rashers, Telur, Saus Tomat dan Cream Mayo, serta Sosis Ayam di pinggirannya",
            isFavorite: false

        )
        return FoodRow(category: food)
    }
}
