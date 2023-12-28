//
//  NewsPageApp.swift
//  NewsPage
//
//  Created by user on 12/28/23.
//

import SwiftUI

@main
struct NewsPageApp: App {
    @StateObject var viewModel = NewsListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                NewsListView()
            }
            .environmentObject(viewModel)
        }
    }
}
