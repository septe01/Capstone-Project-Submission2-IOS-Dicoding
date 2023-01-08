//
//  ProfileResponse.swift
//  Core
//
//  Created by septe habudin on 07/01/23.
//

import Foundation

struct ProfileResponse: Decodable {
    let img: String?
    let name, title: String?
    let git, instagram, linkedin: String?
    let bio: String?
}

