//
//  FoodPresenter.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import SwiftUI
import Combine

class FoodPresenter: ObservableObject {
    private var cancellable: Set<AnyCancellable> = []

    private let categoryUseCase: CategoryUseCase
    private let router = FoodRoute()

    @Published var categories: [CategoryModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(categoryUseCase: CategoryUseCase){
        self.categoryUseCase = categoryUseCase
    }

    func getCategories() {
        loadingState = true
        categoryUseCase.getCategories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }) { categories in
                self.categories = categories
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
