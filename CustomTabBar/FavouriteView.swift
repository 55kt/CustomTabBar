//
//  FavouriteView.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(0..<5) { _ in
                            HStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Favorite Item")
                                        .fontWeight(.semibold)
                                    Text("Description")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(.red)
                            }
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray.opacity(0.1))
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavouriteView()
}
