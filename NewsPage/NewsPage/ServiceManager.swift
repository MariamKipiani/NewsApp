//
//  ServiceManager.swift
//  NewsPage
//
//  Created by user on 12/28/23.
//

import Foundation

enum ServiceError: Error {
    case badURL
    case networkError(Error)
    case decodingError(Error)
}

final class ServiceManager {
    static let shared = ServiceManager()

    private init() {}

    func fetchNews() async throws -> News {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2023-11-27&sortBy=popularity&apiKey=0e34480169b5418f9fc2a24453bd454d") else {
            throw ServiceError.badURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let newsData = try JSONDecoder().decode(News.self, from: data)
            return newsData
        } catch {
            throw ServiceError.networkError(error)
        }
    }
}


struct News: Decodable {

}


//async {
//    do {
//        let news = try await ServiceManager.shared.fetchNews()
//        print("Fetched news: \(news)")
//    } catch {
//        switch error {
//        case ServiceError.badURL:
//            print("Bad URL error")
//        case ServiceError.networkError(let networkError):
//            print("Network error: \(networkError)")
//        case ServiceError.decodingError(let decodingError):
//            print("Decoding error: \(decodingError)")
//        default:
//            print("Unexpected error: \(error)")
//        }
//    }
//}
