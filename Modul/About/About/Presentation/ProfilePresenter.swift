//
//  ProfilePresenter.swift
//  About
//
//  Created by septe habudin on 07/01/23.
//

import Foundation
import Combine
import Core

public class ProfilePresenter: ObservableObject {
    public var cancellables: Set<AnyCancellable> = []

    public let profileUseCase: ProfileUseCase

    @Published  var profile: ProfileModel?
    @Published  var errorMessage: String = ""
    @Published  var loadingState: Bool = false

    public init(profileUseCase: ProfileUseCase) {
        self.profileUseCase = profileUseCase
    }

    func getProfile() {
        loadingState = true
        profileUseCase.getProfiles()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { profile in
                // defined result to profile
                self.profile = profile
            })
            .store(in: &cancellables)
    }
}

