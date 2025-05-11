//
//  TabContent.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct TabContent: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

struct TabButton: View {
    let tab: ContentView.Tab
    @Binding var selectedTab: ContentView.Tab
    var namespace: Namespace.ID
    let selectedGradient: LinearGradient
    let unselectedColor: Color
    
    var body: some View  {
        Text("Some View")
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

#Preview {
    TabContent()
}
