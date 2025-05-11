//
//  SearchView.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    SearchBar(text: $searchText)
                    
                    ScrollView {
                        LazyVGrid(columns : [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 15) {
                            ForEach(0..<10) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(height: 150)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
