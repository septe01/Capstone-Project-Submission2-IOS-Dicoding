//
//  FavoritePresenter.swift
//  Capstone Project
//
//  Created by septe habudin on 13/12/22.
//

import Combine
import SwiftUI

class FavoritePresenter: ObservableObject {
    private var cancellable: Set<AnyCancellable> = []
    
    private let favoriteUseCase: FavoriteUseCase
    private let router = FavoriteRoute()
    
    @Published var favorites: [CategoryModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavorites() {
        self.loadingState = true
        favoriteUseCase.getFavorites()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            } receiveValue: { favorites in
                self.favorites = favorites
            }
            .store(in: &cancellable)
        
    }
    
    func linkBuilder<Content: View>(
        for category: CategoryModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: category)) { content() }
    }
}
