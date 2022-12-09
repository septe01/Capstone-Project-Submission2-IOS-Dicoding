//
//  CategoryInteractor.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import Foundation
import Combine

// create protocol usecase category
protocol CategoryUseCase {
    func getCategories() -> AnyPublisher<[CategoryModel], Error>
}

// create class interactor category for get categories in repository
class CategoryInteractor: CategoryUseCase {

    private let repository: CategoryRepositoryProtocol

    required init(repository: CategoryRepositoryProtocol){
        self.repository = repository
    }

    func getCategories() -> AnyPublisher<[CategoryModel], Error> {
        return repository.getCategories()
    }

}
