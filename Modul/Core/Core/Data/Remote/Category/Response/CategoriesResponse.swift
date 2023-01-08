//
//  CategoriesResponse.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
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

    // change property
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case title = "strCategory"
        case image = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}
