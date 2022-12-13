//
//  FavoriteCategoryModel.swift
//  Capstone Project
//
//  Created by septe habudin on 12/12/22.
//

import Foundation

struct FavoriteCategoryModel: Equatable, Identifiable {

    let id: String
    let title: String
    let image: String
    let description: String
    let isFavorite: Bool
}
