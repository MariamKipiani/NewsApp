//
//  TableViewRepresentable.swift
//  NewsPage
//
//  Created by user on 12/28/23.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var viewModel: NewsListViewModel

    var body: some View {
        List(viewModel.news) { newsItem in
            NewsTableViewCell(newsItem: newsItem)
        }
        .onAppear {
            viewModel.fetchNews()
        }
        .navigationTitle(LocalizedStringKey("News_Title"))
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .environmentObject(NewsListViewModel.preview())
    }
}

struct NewsTableViewCell: View {
    let newsItem: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(newsItem.title)
                .font(.headline)
            Text(newsItem.author ?? NSLocalizedString("Unknown_Author", comment: "Unknown author placeholder"))
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(newsItem.publishedAt)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct TableViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .environmentObject(NewsListViewModel.preview())
    }
}

extension NewsListViewModel {
    static func preview() -> NewsListViewModel {
        let viewModel = NewsListViewModel()
        viewModel.news = [
            Article(author: "Jane Smith", title: "Exciting News Update", publishedAt: "2023-01-02"),
            Article(author: "Bob Johnson", title: "Technology Breakthrough", publishedAt: "2023-01-03"),
         
        ]
        return viewModel
    }
}

