//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, search, favorites, profile
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabContent(selectedTab: $selectedTab)
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
