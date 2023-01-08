//
//  CategoryRemoteDataSourece.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import Foundation
import Alamofire
import Combine

protocol CategoryRemoteDataSourceProtocol {
    func getCategories() -> AnyPublisher<[CategoryResponse], Error>
}

final class CategoryRemoteDataSource: NSObject {
    private override init() {}

    static let sharedInstance: CategoryRemoteDataSource = CategoryRemoteDataSource()
}

extension CategoryRemoteDataSource: CategoryRemoteDataSourceProtocol {
    func getCategories() -> AnyPublisher<[CategoryResponse], Error> {
        return Future<[CategoryResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.category.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: CategoriesResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.categories))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
