//
//  CategoryRepository.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Combine

protocol CategoryRepositoryProtocol {
    func getCategories() -> AnyPublisher<[CategoryModel], Error>
    func addFavorite(category: CategoryModel) -> AnyPublisher<Bool, Error>
    func delFavorite(category: CategoryModel) -> AnyPublisher<Bool, Error>
}


// create final class repository
final class CategoryRepository: NSObject {
    // add instance local and remote data source
    typealias CategoryInstance = (CategoryRemoteDataSource, CategoryLocalDataSource) -> CategoryRepository

    fileprivate let remote: CategoryRemoteDataSource
    fileprivate let local: CategoryLocalDataSource

    private init(remote: CategoryRemoteDataSource, local: CategoryLocalDataSource) {
        self.remote = remote
        self.local = local
    }

    static let sharedInstance: CategoryInstance = { remoteRepo, localRepo in
        return CategoryRepository(remote: remoteRepo, local: localRepo)
    }
}


extension CategoryRepository: CategoryRepositoryProtocol {

    // manipulation data source
    func getCategories() -> AnyPublisher<[CategoryModel], Error> {
        return local.getCategories()
            .flatMap { result -> AnyPublisher<[CategoryModel], Error> in
                // if result from local empty
                if result.isEmpty {
                    return self.remote.getCategories()
                    // map from response
                        .map { CategoryMapper.mapCategoryResponseToEntity(input: $0)}
                    // after map save to local
                        .flatMap { self.local.addCategories(from: $0)}
                        .filter { $0 }
                        .flatMap { _ in self.local.getCategories()
                                .map { CategoryMapper.mapCategoryEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()

                    // if local data not empty
                } else {
                    return self.local.getCategories()
                        .map { CategoryMapper.mapCategoryEntityToDomain(input: $0 )}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()

        // when not use local storage
        //        return self.remote.getCategories()
        //            .map { CategoryMapper.mapCategoryResponseToDomains(input: $0) }
        //            .eraseToAnyPublisher()
    }

    func addFavorite(category: CategoryModel) -> AnyPublisher<Bool, Error> {
        return self.local.addFavoriteCategory(from: category)
    }

    func delFavorite(category: CategoryModel) -> AnyPublisher<Bool, Error> {
        return self.local.delFavoriteCategory(from: category)
    }

}

