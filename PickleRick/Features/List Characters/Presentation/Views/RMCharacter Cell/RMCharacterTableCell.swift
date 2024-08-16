//
//  RMCharacterTableCell.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import UIKit
import SwiftUI

class RMCharacterTableCell: UITableViewCell {
    // MARK: - properties
    private var hostingController: UIHostingController<RMCharacterView>?
    
    // MARK: - public methods
    func configure(with rmCharacter: RMCharacter) {
        setupHostingController(with: rmCharacter)
        selectionStyle = .none
    }
    
    // MARK: - private methods
    private func setupHostingController(with rmCharacter: RMCharacter) {
        let rmCharacterView = RMCharacterView(rmCharacter: rmCharacter)
        
        if hostingController == nil {
            hostingController = UIHostingController(rootView: rmCharacterView)
            hostingController?.view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(hostingController!.view)
            
            NSLayoutConstraint.activate([
                hostingController!.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
                hostingController!.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
                hostingController!.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0),
                hostingController!.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0)
            ])
        } else {
            hostingController?.rootView = rmCharacterView
        }
    }
}
