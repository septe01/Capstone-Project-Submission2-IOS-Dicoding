//
//  ProfileRepository.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation
import  Combine

protocol ProfileRepositoryProtocol {
    func getProfiles() -> AnyPublisher<ProfileModel, Error>
}

final class ProfileRepository: NSObject {

    typealias ProfileInstance = (ProfileDataSource) -> ProfileRepository

    fileprivate let remote: ProfileDataSource

    private init( remote: ProfileDataSource) {
        self.remote = remote
    }

    static let sharedInstance: ProfileInstance = {  remoteRepo in
        return ProfileRepository(remote: remoteRepo)
    }

}

extension ProfileRepository: ProfileRepositoryProtocol {
    func getProfiles() -> AnyPublisher<ProfileModel, Error> {
        return self.remote.getProfiles()
            .map { ProfileMapper.mapProfileToDomains(input: $0)  }
            .eraseToAnyPublisher()
    }
}
