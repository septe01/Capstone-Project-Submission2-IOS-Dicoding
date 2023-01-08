//
//  FavoriteRepository.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Combine

protocol FavoriteRepositoryProtocol {
    func getFavorites() -> AnyPublisher<[CategoryModel], Error>
}


final class FavoriteRepository: NSObject {
    typealias FavoriteInstance = (FavoriteLocalDataSource) -> FavoriteRepository

    fileprivate let localFavorite: FavoriteLocalDataSource

    private init(localFavorite: FavoriteLocalDataSource) {
        self.localFavorite = localFavorite
    }

    static let sharedInstance: FavoriteInstance = { localFavoriteRepo in
        return FavoriteRepository(localFavorite: localFavoriteRepo)
    }
}

extension FavoriteRepository: FavoriteRepositoryProtocol {
    func getFavorites() -> AnyPublisher<[CategoryModel], Error> {
        return localFavorite.getFavorites()
            .map { FavoriteMapper.favoriteEntityToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
}

