//
//  FoodRoute.swift
//  Capstone Project
//
//  Created by septe habudin on 10/12/22.
//

import SwiftUI

class FoodRoute {

    func makeDetailView(for category: CategoryModel) -> some View {
        let categoryDetailUseCase = Injection.init().provideDetailCategory(category: category)
        let presenter = FoodDetailPresenter(categoryDetailUseCase: categoryDetailUseCase)

        return FoodDetailView(presenter: presenter)
    }
}
