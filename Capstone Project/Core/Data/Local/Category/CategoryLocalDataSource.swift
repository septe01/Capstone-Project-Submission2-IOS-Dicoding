//
//  CategoryLocalDataSource.swift
//  Capstone Project
//
//  Created by septe habudin on 11/12/22.
//

import Foundation
import RealmSwift
import Combine


protocol CategoryLocalDataSourceProtocol: class {
    func getCategories() -> AnyPublisher<[CategoryEntity], Error>
    func addCategories(from categories: [CategoryEntity]) -> AnyPublisher<Bool, Error>
    func addFavoriteCategory(from category: CategoryModel) -> AnyPublisher<Bool, Error>
    func delFavoriteCategory(from category: CategoryModel) -> AnyPublisher<Bool, Error>
}


// create final class data source
final class CategoryLocalDataSource: NSObject {
    private let realm: Realm?

    private init(realm: Realm?) {
        self.realm = realm
    }

    static let sharedInstance: (Realm?) -> CategoryLocalDataSource = { realmDatabase in
        return CategoryLocalDataSource(realm: realmDatabase)
    }
}


// CategoryLocalDataSource interface CategoryLocalDataSourceProtocol
extension CategoryLocalDataSource: CategoryLocalDataSourceProtocol{

    // get local category
    func getCategories() -> AnyPublisher<[CategoryEntity], Error> {
        return Future<[CategoryEntity], Error> { completion in
            // cek realm
            if let realm = self.realm {
                let categories: Results<CategoryEntity> = {
                    realm.objects(CategoryEntity.self)
                        .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: CategoryEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    // add categoriy to realm
    func addCategories(
        from categories: [CategoryEntity]
    ) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            // cek realm
            if let realm = self.realm {
                do {
                    try realm.write{
                        for category in categories {
                            realm.add(category, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    // add category favorite
    func addFavoriteCategory(
        from category: CategoryModel
    ) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let favorite = FavoriteCategoryEntity(value: [
                        "id": category.id,
                        "title": category.title,
                        "image": category.image,
                        "desc": category.description,
                        "isFavorite": "1"
                    ])
                    try realm.write{
                        realm.add(favorite)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

    func delFavoriteCategory(from category: CategoryModel) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write{
                        let favoriteCategory = realm.objects(FavoriteCategoryEntity.self).where {
                            $0.id == category.id
                        }
                        realm.delete(favoriteCategory)
                        completion(.success(false))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }

}


extension Results {

    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }

}
