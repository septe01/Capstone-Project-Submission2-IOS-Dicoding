//
//  FoodRoute.swift
//  Food
//
//  Created by septe habudin on 08/01/23.
//

import SwiftUI
import Core

class FoodRoute {

    func makeDetailView(for category: CategoryModel) -> some View {
        let categoryDetailUseCase = Injection.init().provideDetailCategory(category: category)
        let categoryUseCase = Injection.init().provideCategory()
        let presenter = FoodDetailPresenter(categoryDetailUseCase: categoryDetailUseCase, categoryUseCase: categoryUseCase)

        return FoodDetailView(presenter: presenter)
    }
}

