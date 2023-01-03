//
//  ProfileDataSource.swift
//  Capstone Project
//
//  Created by septe habudin on 08/12/22.
//

import Foundation
import Alamofire
import Combine

protocol ProfileDataSourceProtocol {

    func getProfiles() -> AnyPublisher<ProfileResponse, Error>

}

final class ProfileDataSource: NSObject {

    private override init() { }

    static let sharedInstance: ProfileDataSource =  ProfileDataSource()

}

extension ProfileDataSource: ProfileDataSourceProtocol {
    func getProfiles() -> AnyPublisher<ProfileResponse, Error> {
        return Future<ProfileResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.profile.url) {
                AF.request(url)
                    .responseDecodable(of: ProfileResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
