//
//  CategoryDetailInteractor.swift
//  Capstone Project
//
//  Created by septe habudin on 10/12/22.
//

import Foundation

protocol CategoryDetailUseCase {
    func getCategory() -> CategoryModel
}

// create interactor detail
class CategoryDetailInteractor: CategoryDetailUseCase {
    private let repository: CategoryRepositoryProtocol
    private let category: CategoryModel

    required init(
        repository: CategoryRepositoryProtocol,
        category: CategoryModel
    ) {
        self.repository = repository
        self.category = category
    }

    func getCategory() -> CategoryModel {
        return category
    }
}
