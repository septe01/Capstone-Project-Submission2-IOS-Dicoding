//
//  FavoriteRoute.swift
//  Capstone Project
//
//  Created by septe habudin on 13/12/22.
//

import Foundation
import SwiftUI


class FavoriteRoute {

    func makeDetailView(for category: CategoryModel) -> some View {
        let categoryDetailUseCase = Injection.init().provideDetailCategory(category: category)
        let categoryUseCase = Injection.init().provideCategory()
        let presenter = FoodDetailPresenter(categoryDetailUseCase: categoryDetailUseCase, categoryUseCase: categoryUseCase)

        return FoodDetailView(presenter: presenter)
    }
}
