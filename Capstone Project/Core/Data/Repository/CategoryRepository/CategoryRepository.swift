//
//  CategoryRepository.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import Foundation
import Combine

protocol CategoryRepositoryProtocol {
    func getCategories() -> AnyPublisher<[CategoryModel], Error>
}


// create final class repository
final class CategoryRepository: NSObject {
    typealias CategoryInstance = (CategoryRemoteDataSource) -> CategoryRepository

    fileprivate let remote: CategoryRemoteDataSource

    private init(remote: CategoryRemoteDataSource) {
        self.remote = remote
    }

    static let sharedInstance: CategoryInstance = { remoteRepo in
        return CategoryRepository(remote: remoteRepo)
    }
}


extension CategoryRepository: CategoryRepositoryProtocol {
    func getCategories() -> AnyPublisher<[CategoryModel], Error> {
        return self.remote.getCategories()
            .map { CategoryMapper.mapCategoryResponseToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
