//
//  HomeView.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct HomeView: View {
    private let gradient = LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.opacity(0.95)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(0..<5) { index in
                            SimpleCardView(index: index)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NotificationButton(gradient: gradient)
                }
            }
        }
    }
}

struct NotificationButton: View {
    let gradient: LinearGradient
    
    var body: some View  {
        Button {
            // action
        } label: {
            Image(systemName: "bell.badge")
                .foregroundStyle(gradient)
        }
    }
}

struct SimpleCardView: View {
    let index: Int
    @State private var isHovered = false
    
    var body: some View {
        CardContainer(isHovered: isHovered) {
            CardContentView(index: index)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isHovered.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isHovered.toggle()
                }
            }
        }
    }
}

struct CardContainer<Content: View>: View {
    let isHovered: Bool
    let content: Content
    
    init(isHovered: Bool, @ViewBuilder content: () -> Content) {
        self.isHovered = isHovered
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(height: 140)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.1))
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(colors: [.white.opacity(0.2), .white.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing),
                        lineWidth: 0.5
                    )
            }
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            .scaleEffect(isHovered ? 1.02 : 1.0)
        
    }
}

struct CardContentView: View {
    let index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: "sparkles")
                    .font(.title2)
                    .foregroundStyle(.blue, .purple)
                
                Text("Card title \(index + 1)")
                    .font(.headline)
                
                Text("This is a cool card description with some gradient effects")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    CardContentView(index: 0)
}

#Preview {
    HomeView()
}
