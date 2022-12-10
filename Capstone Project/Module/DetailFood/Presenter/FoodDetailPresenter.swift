//
//  FoodDetailPresenter.swift
//  Capstone Project
//
//  Created by septe habudin on 10/12/22.
//

import Foundation

class FoodDetailPresenter: ObservableObject {
    private let categoryDetailUseCase: CategoryDetailUseCase

    @Published var category: CategoryModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(categoryDetailUseCase: CategoryDetailUseCase){
        self.categoryDetailUseCase = categoryDetailUseCase
        category = categoryDetailUseCase.getCategory()
    }
}
