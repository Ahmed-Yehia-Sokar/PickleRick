//
//  FilterCellView.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import SwiftUI

struct FilterCellView: View {
    var filterOption: FilterOption
    
    var body: some View {
        filterNameText
    }
    
    private var filterNameText: some View {
        Text(filterOption.rawValue)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    FilterCellView(filterOption: .all)
}
