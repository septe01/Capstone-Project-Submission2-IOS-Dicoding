//
//  Injection.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation
import RealmSwift

final class Injection: NSObject {

    private func provideRepositoryCategory() -> CategoryRepositoryProtocol {
        let realm = try? Realm()

        let remote: CategoryRemoteDataSource = CategoryRemoteDataSource.sharedInstance
        let local: CategoryLocalDataSource = CategoryLocalDataSource.sharedInstance(realm)

        return CategoryRepository.sharedInstance(remote, local)
    }

    func provideCategory() -> CategoryUseCase {
        let repository = provideRepositoryCategory()
        return CategoryInteractor(repository: repository)
    }

    // method inject detail category
    func provideDetailCategory(category: CategoryModel) -> CategoryDetailUseCase {
        let repository = provideRepositoryCategory()
        return CategoryDetailInteractor(repository: repository, category: category)
    }

}

extension Injection {
    private func provideRepositoryProfile() -> ProfileRepositoryProtocol {

        let remote: ProfileDataSource = ProfileDataSource.sharedInstance

        return ProfileRepository.sharedInstance(remote)
    }

    func provideProfile() -> ProfileUseCase {
      let repository = provideRepositoryProfile()
      return ProfileInteractor(repository: repository)
    }
}
