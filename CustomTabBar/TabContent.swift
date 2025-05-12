//
//  TabContent.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct TabContent: View {
    @Binding var selectedTab: ContentView.Tab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(ContentView.Tab.home)
            
            SearchView()
                .tag(ContentView.Tab.search)
            
            FavouriteView()
                .tag(ContentView.Tab.favorites)
            
            ProfileView()
                .tag(ContentView.Tab.profile)
        }
    }
}

struct TabButtonOverlay: View {
    let selectedGradient: LinearGradient
    var namespace: Namespace.ID
    
    var body: some View  {
        Circle()
            .fill(selectedGradient)
            .matchedGeometryEffect(id: "tab", in: namespace)
            .frame(width: 65, height: 65)
            .blur(radius: 20)
            .opacity(0.3)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: ContentView.Tab
    @Namespace private var namespace
    
    private let selectedGradient = LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    private let unselectedColor = Color.gray.opacity(0.7)
    private let glassEffect = Color.black.opacity(0.8)
    
    var body: some View  {
        HStack {
            ForEach(tabItems, id: \.self) { tab in
                Spacer()
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace, selectedGradient: selectedGradient, unselectedColor: unselectedColor)
                Spacer()
            }
        }
        .frame(height: 85)
        .background(TabBarBackground(glassEffect: glassEffect))
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
    
    private var tabItems: [ContentView.Tab] {
        [.home, .search, .favorites, .profile]
    }
}

struct TabButton: View {
    let tab: ContentView.Tab
    @Binding var selectedTab: ContentView.Tab
    var namespace: Namespace.ID
    let selectedGradient: LinearGradient
    let unselectedColor: Color
    
    var body: some View  {
        VStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: selectedTab == tab ? 28 : 24))
                .symbolEffect(.bounce.up.byLayer, value: selectedTab == tab)
            
            Text(tabName)
                .font(.caption2)
                .fontWeight(selectedTab == tab ? .semibold : .regular)
        }
        .foregroundStyle(selectedTab == tab ? AnyShapeStyle(selectedGradient) : AnyShapeStyle(unselectedColor))
        .overlay {
            if selectedTab == tab {
                TabButtonOverlay(selectedGradient: selectedGradient, namespace: namespace)
            }
        }
        .frame(width: 65, height: 65)
        .scaleEffect(selectedTab == tab ? 1.1 : 1.0)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.bouncy(duration: 0.3, extraBounce: 0.3)) {
                selectedTab = tab
            }
        }
    }
    
    private var iconName: String {
        switch tab {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass"
        case .favorites:
            return "heart.fill"
        case .profile:
            return "person.fill"
        }
    }
    
    private var tabName: String {
        switch tab {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        }
    }
}

struct TabBarBackground: View {
    let glassEffect: Color
    
    var body: some View  {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(glassEffect)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(colors: [.white.opacity(0.1), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(
                    LinearGradient(colors: [.white.opacity(0.2), .white.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 0.5
                )
        }
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}
