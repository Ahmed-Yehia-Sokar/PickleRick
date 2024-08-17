//
//  FilterCollectionCell.swift
//  PickleRick
//
//  Created by Admin on 17/08/2024.
//

import UIKit
import SwiftUI

class FilterCollectionCell: UICollectionViewCell {
    // MARK: - public methods
    func configure(with filterOption: FilterOption) {
        setupHostingController(with: filterOption)
    }
    
    // MARK: - private methods
    private func setupHostingController(with filterOption: FilterOption) {
        let filterCellView = FilterCellView(filterOption: filterOption)
        let hostingController: UIHostingController<FilterCellView> = UIHostingController(rootView: filterCellView)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
