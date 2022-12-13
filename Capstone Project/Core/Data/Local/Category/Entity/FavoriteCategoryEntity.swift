//
//  FavoriteCategoryEntity.swift
//  Capstone Project
//
//  Created by septe habudin on 12/12/22.
//

import Foundation
import RealmSwift

class FavoriteCategoryEntity: Object {
    @Persisted(primaryKey: true) var id: String  = ""
    @Persisted var title: String  = ""
    @Persisted var image: String  = ""
    @Persisted var desc: String  = ""
    @Persisted var isFavorite: String  = ""

}
