//
//  CategoryInteractor.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Combine

// create protocol usecase category
public protocol CategoryUseCase {
    func getCategories() -> AnyPublisher<[CategoryModel], Error>
    func handleFavorite(category: CategoryModel, type: String) -> AnyPublisher<Bool, Error>
}

// create class interactor category for get categories in repository
public class CategoryInteractor: CategoryUseCase {

    private let repository: CategoryRepositoryProtocol

    required init(repository: CategoryRepositoryProtocol){
        self.repository = repository
    }

    public func getCategories() -> AnyPublisher<[CategoryModel], Error> {
        return repository.getCategories()
    }

    public func handleFavorite(category: CategoryModel, type: String) -> AnyPublisher<Bool, Error> {
        if type == "add" {
            return repository.addFavorite(category: category)
        }else {
            return repository.delFavorite(category: category)
        }
    }

}

