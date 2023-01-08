//
//  APICall.swift
//  Core
//
//  Created by septe habudin on 07/01/23.
//

import Foundation

// swiftlint:disable type_name
struct API {

    static let baseUrl = "https://next-source-api-ios-expert.vercel.app/api/"

}

class APIKey {
    private var key: String = ""

    init() {
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            fatalError("Couldn't find file 'Info.plist'.")
        }

        let plist = NSDictionary(contentsOfFile: filePath)
        guard let apiKey = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
        }

        self.key = apiKey
    }

    func getKey() -> String {
        return self.key
    }
}

protocol Endpoint {

    var url: String { get }

}

enum Endpoints {

    enum Gets: Endpoint {
        case profile
        case category

        public var url: String {
            switch self {
            case .profile: return "\(API.baseUrl)profile"
            case .category: return "\(API.baseUrl)category?api_key=\(APIKey().getKey())"

            }
        }
    }

}

