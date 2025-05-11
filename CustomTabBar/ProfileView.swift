//
//  ProfileView.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 25) {
                        VStack(spacing: 15) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 80))
                                .foregroundStyle(.blue)
                            
                            Text("Volos Software LLC")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("@VSLLC")
                                .foregroundStyle(.secondary)
                        }
                        .padding(.top)
                        
                        HStack(spacing: 10) {
                            StartView(title: "Posts", value: "28932")
                            StartView(title: "Followers", value: "9.3M")
                            StartView(title: "Following", value: "453")
                        }
                        
                        VStack(spacing: 15) {
                            MenuRow(icon: "gear", title: "Settings")
                            MenuRow(icon: "bell", title: "Notifications")
                            MenuRow(icon: "lock", title: "Privacy")
                            MenuRow(icon: "questionmark.circle", title: "Help")
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // action
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

struct StartView: View {
    let title: String
    let value: String
    
    var body: some View {
        Text(value)
            .font(.title3)
            .fontWeight(.bold)
        
        Text(title)
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

struct MenuRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
        )
    }
}

#Preview {
    ProfileView()
}
