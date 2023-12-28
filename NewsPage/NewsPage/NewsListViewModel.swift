//
//  NewsListViewModel.swift
//  NewsPage
//
//  Created by user on 12/28/23.
//

import Foundation

@MainActor
final class NewsListViewModel: ObservableObject {
    @Published var news: [Article] = []

    init() {
        fetchNews()
    }

    func fetchNews() {
        Task {
            do {
                let data = try await ServiceManager.shared.fetchNews()
                news = data.articles
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

