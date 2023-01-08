//
//  CategoryDetailInteractor.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Combine

public protocol CategoryDetailUseCase {
    func getCategory() -> CategoryModel
}

// create interactor detail
public class CategoryDetailInteractor: CategoryDetailUseCase {


    private let repository: CategoryRepositoryProtocol
    private let category: CategoryModel

    required init(
        repository: CategoryRepositoryProtocol,
        category: CategoryModel
    ) {
        self.repository = repository
        self.category = category
    }

    public func getCategory() -> CategoryModel {
        return category
    }

}

