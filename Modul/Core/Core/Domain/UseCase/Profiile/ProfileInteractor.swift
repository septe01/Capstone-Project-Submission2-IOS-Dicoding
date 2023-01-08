//
//  ProfileInteractor.swift
//  Core
//
//  Created by septe habudin on 07/01/23.
//

import Foundation
import Combine

public protocol ProfileUseCase {

    func getProfiles() -> AnyPublisher<ProfileModel, Error>

}

public class ProfileInteractor: ProfileUseCase {

    private let repository: ProfileRepositoryProtocol

    required init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }

    public func getProfiles() -> AnyPublisher<ProfileModel, Error> {
        return repository.getProfiles()
    }

}

