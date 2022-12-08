//
//  Injection.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation

final class Injection: NSObject {

  private func provideRepository() -> ProfileRepositoryProtocol {

      let remote: ProfileDataSource = ProfileDataSource.sharedInstance

      return ProfileRepository.sharedInstance(remote)
  }

  func provideProfile() -> ProfileUseCase {
    let repository = provideRepository()
    return ProfileInteractor(repository: repository)
  }


}
