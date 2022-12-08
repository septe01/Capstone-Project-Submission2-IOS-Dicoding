//
//  ProfileInteractor.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation
import Combine

protocol ProfileUseCase {

    func getProfiles() -> AnyPublisher<ProfileModel, Error>

}

class ProfileInteractor: ProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    required init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }

    func getProfiles() -> AnyPublisher<ProfileModel, Error> {
        return repository.getProfiles()
    }

}
