//
//  CategoryMapper.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import Foundation

final class CategoryMapper {

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
