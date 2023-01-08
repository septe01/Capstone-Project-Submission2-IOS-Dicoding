//
//  FavoriteMapper.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation

final class FavoriteMapper {

    static func favoriteEntityToDomain(
        input favoriteResponse: [FavoriteCategoryEntity]
    ) -> [CategoryModel] {
        return favoriteResponse.map { result in
            return CategoryModel(
                id: result.id,
                title: result.title,
                image: result.image,
                description: result.desc
            )
        }
    }
}

