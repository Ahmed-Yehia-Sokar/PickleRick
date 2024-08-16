//
//  RMCharactersFilterCollectionCell.swift
//  PickleRick
//
//  Created by Admin on 17/08/2024.
//

import UIKit
import SwiftUI

class RMCharactersFilterCollectionCell: UICollectionViewCell {
    // MARK: - properties
    private var hostingController: UIHostingController<RMCharactersFilterView>?
    
    // MARK: - public methods
    func configure(with filterName: String) {
        setupHostingController(with: filterName)
    }
    
    // MARK: - private methods
    private func setupHostingController(with filterName: String) {
        let rmCharactersFilterView = RMCharactersFilterView(filterName: filterName)
        
        if hostingController == nil {
            hostingController = UIHostingController(rootView: rmCharactersFilterView)
            hostingController?.view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(hostingController!.view)
            
            NSLayoutConstraint.activate([
                hostingController!.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                hostingController!.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                hostingController!.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                hostingController!.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        } else {
            hostingController?.rootView = rmCharactersFilterView
        }
    }
}
