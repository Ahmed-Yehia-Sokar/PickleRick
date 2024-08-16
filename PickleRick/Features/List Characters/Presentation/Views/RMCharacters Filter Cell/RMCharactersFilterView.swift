//
//  RMCharactersFilterView.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import SwiftUI

struct RMCharactersFilterView: View {
    var filterName: String
    
    var body: some View {
        filterNameText
    }
    
    private var filterNameText: some View {
        Text(filterName)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    RMCharactersFilterView(filterName: "Alive")
}
