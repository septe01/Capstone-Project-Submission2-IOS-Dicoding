//
//  CategoryMapper.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
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
                description: result.desc
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
                description: result.description
            )
        }
    }
}

