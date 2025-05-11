//
//  SearchBar.swift
//  CustomTabBar
//
//  Created by Vlad on 11/5/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            TextField("Search", text: $text)
                .textFieldStyle(.plain)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
        )
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
