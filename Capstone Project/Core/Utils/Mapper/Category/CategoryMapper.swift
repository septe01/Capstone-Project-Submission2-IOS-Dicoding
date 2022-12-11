//
//  CategoryMapper.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import Foundation

final class CategoryMapper {

    // mapper from response to entity
    static func mapCategoryResponseToEntity(
        input categoryResponse: [CategoryResponse]
    ) -> [CategoryEntity] {
        return categoryResponse.map { result in
            let newCategory = CategoryEntity()
            newCategory.id = result.id
            newCategory.title = result.title
            newCategory.image = result.image
            newCategory.desc = result.description
            newCategory.isFavorite = result.isFavorite ?? false

            return newCategory
        }
    }

    // mapper from entity to domain layer
    static func mapCategoryEntityToDomain(
        input categoryResponse: [CategoryEntity]
    ) -> [CategoryModel] {
        return categoryResponse.map { result in
            return CategoryModel(
                id: result.id,
                title: result.title,
                image: result.image,
                description: result.desc,
                isFavorite: result.isFavorite
            )
        }
    }

    // mapper from response to domain
    static func mapCategoryResponseToDomains(
        input categoryResponse: [CategoryResponse]
    ) -> [CategoryModel] {

        return categoryResponse.map { result in
            return CategoryModel(
                id: result.id,
                title: result.title,
                image: result.image,
                description: result.description,
                isFavorite: result.isFavorite ?? false
            )
        }
    }
}
