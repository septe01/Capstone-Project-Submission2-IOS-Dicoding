//
//  ProfileResponse.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation

struct ProfileResponse: Decodable {
    let img: String?
    let name, title: String?
    let git, instagram, linkedin: String?
    let bio: String?
}
