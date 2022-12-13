//
//  FavoriteLocalDataSource.swift
//  Capstone Project
//
//  Created by septe habudin on 13/12/22.
//

import Foundation
import Combine
import RealmSwift

protocol FavoriteLocalDataSourceProtocol {
    func getFavorites() -> AnyPublisher<[FavoriteCategoryEntity], Error>
}

final class FavoriteLocalDataSource: NSObject {
    private let realm: Realm?

    private init(realm: Realm?) {
        self.realm = realm
    }

    static let sharedInstance: (Realm?) -> FavoriteLocalDataSource = { realmDb in
        return FavoriteLocalDataSource(realm: realmDb)
    }
}

extension FavoriteLocalDataSource: FavoriteLocalDataSourceProtocol {
    func getFavorites() -> AnyPublisher<[FavoriteCategoryEntity], Error> {
        return Future<[FavoriteCategoryEntity], Error> { completion in
            if let realm = self.realm {
                let favorite = realm.objects(FavoriteCategoryEntity.self)
                completion(.success(favorite.toArray(ofType: FavoriteCategoryEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

