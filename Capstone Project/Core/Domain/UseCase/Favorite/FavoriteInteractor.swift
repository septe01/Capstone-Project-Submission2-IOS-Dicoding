//
//  FavoriteInteractor.swift
//  Capstone Project
//
//  Created by septe habudin on 13/12/22.
//

import Foundation
import Combine

protocol FavoriteUseCase {
    func getFavorites() -> AnyPublisher<[CategoryModel], Error>
}

class FavoriteInteractor: FavoriteUseCase {
    private let repository: FavoriteRepositoryProtocol

    required init(repository: FavoriteRepositoryProtocol) {
        self.repository = repository
    }

    func getFavorites() -> AnyPublisher<[CategoryModel], Error> {
        return repository.getFavorites()
    }    
}
