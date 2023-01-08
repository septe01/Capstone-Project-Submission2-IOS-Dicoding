//
//  FavoriteCategoryEntity.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import RealmSwift

public class FavoriteCategoryEntity: Object {
    @Persisted(primaryKey: true) public var id: String  = ""
    @Persisted public var title: String  = ""
    @Persisted public var image: String  = ""
    @Persisted public var desc: String  = ""
    @Persisted public var isFavorite: String  = ""

}

