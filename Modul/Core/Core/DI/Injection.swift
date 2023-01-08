//
//  Injection.swift
//  Core
//
//  Created by septe habudin on 07/01/23.
//

import Foundation
import RealmSwift

public final class Injection: NSObject {
    private func provideRepositoryCategory() -> CategoryRepositoryProtocol {
        let realm = try? Realm()

        let remote: CategoryRemoteDataSource = CategoryRemoteDataSource.sharedInstance
        let local: CategoryLocalDataSource = CategoryLocalDataSource.sharedInstance(realm)

        return CategoryRepository.sharedInstance(remote, local)
    }

    public func provideCategory() -> CategoryUseCase {
        let repository = provideRepositoryCategory()
        return CategoryInteractor(repository: repository)
    }

    // method inject detail category
    public func provideDetailCategory(category: CategoryModel) -> CategoryDetailUseCase {
        let repository = provideRepositoryCategory()
        return CategoryDetailInteractor(repository: repository, category: category)
    }

    public func provideFavoriteCategory(category: CategoryModel) -> CategoryUseCase {
        let repository = provideRepositoryCategory()
        return CategoryInteractor(repository: repository)
    }
}

extension Injection {
    private func provideRepositoryProfile() -> ProfileRepositoryProtocol {

        let remote: ProfileDataSource = ProfileDataSource.sharedInstance

        return ProfileRepository.sharedInstance(remote)
    }

   public func provideProfile() -> ProfileUseCase {
      let repository = provideRepositoryProfile()
      return ProfileInteractor(repository: repository)
    }
}

extension Injection {

    private func provideRepositoryFavorite() -> FavoriteRepositoryProtocol {
        let realm = try? Realm()

        let favoriteLocal: FavoriteLocalDataSource = FavoriteLocalDataSource.sharedInstance(realm)

        return FavoriteRepository.sharedInstance(favoriteLocal)
    }

    public func provideFavorite() -> FavoriteUseCase {
      let repository = provideRepositoryFavorite()
      return FavoriteInteractor(repository: repository)
    }
}
