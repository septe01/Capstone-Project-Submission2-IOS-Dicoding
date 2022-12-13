//
//  CategoryEntity.swift
//  Capstone Project
//
//  Created by septe habudin on 11/12/22.
//

import Foundation
import RealmSwift

class CategoryEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var desc: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
