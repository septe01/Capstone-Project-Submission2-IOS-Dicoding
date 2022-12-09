//
//  Injection.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation

final class Injection: NSObject {

    private func provideRepositoryCategory() -> CategoryRepositoryProtocol {
        let remote: CategoryRemoteDataSource = CategoryRemoteDataSource.sharedInstance

        return CategoryRepository.sharedInstance(remote)
    }

    func provideCategory() -> CategoryUseCase {
        let repository = provideRepositoryCategory()
        return CategoryInteractor(repository: repository)
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
