//
//  RMCharacterView.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import SwiftUI
import Kingfisher

struct RMCharacterView: View {
    let rmCharacter: RMCharacter
    
    var body: some View {
        HStack(spacing: 16.0) {
            characterImage
            characterDetails
            Spacer()
        }
    }
    
    private var characterImage: some View {
        KFImage(URL(string: rmCharacter.image))
            .placeholder {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .resizable()
            .scaledToFit()
            .frame(width: 90.0, height: 90.0)
            .clipShape(
                RoundedRectangle(cornerRadius: 12.0)
            )
    }
    
    private var characterDetails: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            characterNameText
            characterSpeciesText
        }
    }
    
    private var characterNameText: some View {
        Text(rmCharacter.name)
            .font(.headline)
    }
    
    private var characterSpeciesText: some View {
        Text(rmCharacter.species)
    }
}

#Preview {
    RMCharacterView(rmCharacter: RMCharacter.example)
}
