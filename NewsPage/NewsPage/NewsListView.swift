//
//  NewsListView.swift
//  NewsPage
//
//  Created by user on 12/28/23.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var viewModel: NewsListViewModel

    struct Constants {
        static let newsTitle = "News"
        static let noArticlesMessage = "No news at the moment."
    }

    var body: some View {
        NavigationStack {
            if viewModel.articles.isEmpty {
                Text(Constants.noArticlesMessage)
                    .padding()
            } else {
                TableViewRepresentable()
            }
        }
        .navigationBarTitle(Constants.newsTitle, displayMode: .large)
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .environmentObject(NewsListViewModel())
    }
}
