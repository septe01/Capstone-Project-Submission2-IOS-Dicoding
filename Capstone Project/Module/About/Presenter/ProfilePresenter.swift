//
//  ProfilePresenter.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation
import Combine

class ProfilePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []

    private let profileUseCase: ProfileUseCase

    @Published var profile: ProfileModel?
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(profileUseCase: ProfileUseCase) {
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
