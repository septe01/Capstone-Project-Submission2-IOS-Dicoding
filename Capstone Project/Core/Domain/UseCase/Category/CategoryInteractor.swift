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
    func handleFavorite(category: CategoryModel, type: String) -> AnyPublisher<Bool, Error>
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

    func handleFavorite(category: CategoryModel, type: String) -> AnyPublisher<Bool, Error> {
        if type == "add" {
            return repository.addFavorite(category: category)
        }else {
            return repository.delFavorite(category: category)
        }
    }

}
