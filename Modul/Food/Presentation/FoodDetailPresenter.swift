//
//  FoodDetailPresenter.swift
//  Food
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Combine
import RealmSwift
import Core

public class FoodDetailPresenter: ObservableObject {
    private var cancellable: Set<AnyCancellable> = []
    private let categoryDetailUseCase: CategoryDetailUseCase
    private let categoryUseCase: CategoryUseCase

    @Published var category: CategoryModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var favorite: Bool = false

    public init(categoryDetailUseCase: CategoryDetailUseCase, categoryUseCase: CategoryUseCase){
        self.categoryDetailUseCase = categoryDetailUseCase
        self.categoryUseCase = categoryUseCase

        category = categoryDetailUseCase.getCategory()
    }

    func isFavorite(category: CategoryModel) {
        let realm = try! Realm()
        let isExist =  realm.objects(FavoriteCategoryEntity.self).where {
            $0.id == category.id
        }.first

        if isExist != nil {
            self.favorite = true
        } else {
            self.favorite = false
        }
    }

    func addFavorite(category: CategoryModel) {
        categoryUseCase.handleFavorite(category: category, type: "add")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    print("sink add Favorite finished")
                }
            }) { res in
                self.favorite = res
            }
            .store(in: &cancellable)
    }


    func delFavorite(category: CategoryModel) {
        categoryUseCase.handleFavorite(category: category, type: "delete")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    print("sink deleted Favorite finished")
                }
            }) { res in
                self.favorite = res
            }
            .store(in: &cancellable)
    }
}
