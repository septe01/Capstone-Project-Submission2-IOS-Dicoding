//
//  CategoriesResponse.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import Foundation

// MARK: - Categories
struct CategoriesResponse: Decodable {
    let categories: [CategoryResponse]
}

// MARK: - Category
struct CategoryResponse: Decodable {

    let id: String
    let title: String
    let image: String
    let description: String
    let isFavorite: Bool?

    // change property
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case title = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
        case isFavorite = "favorite"
    }
}
