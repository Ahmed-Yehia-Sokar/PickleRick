//
//  DisplayCharacterDetailsViewController.swift
//  PickleRick
//
//  Created by Admin on 17/08/2024.
//

import UIKit
import Kingfisher

class DisplayCharacterDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    @IBOutlet weak var characterLocationLabel: UILabel!
    
    // MARK: - properties
    private var viewModel: DisplayCharacterDetailsViewModel?
    
    func configure(withViewModel viewModel: DisplayCharacterDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCharacterImage()
        setupCharacterNameLabel()
        setupCharacterStatusLabel()
        setupCharacterSpeciesLabel()
        setupCharacterGenderLabel()
        setupCharacterLocationLabel()
    }
    
    // MARK: - private methods
    private func setupCharacterImage() {
        guard let viewModel = viewModel else { return }
        characterImage.kf.setImage(with: URL(string: viewModel.getImagePath()))
        characterImage.layer.cornerRadius = 10
    }
    
    private func setupCharacterNameLabel() {
        guard let viewModel = viewModel else { return }
        characterNameLabel.text = viewModel.getCharacterName()
    }
    
    private func setupCharacterStatusLabel() {
        guard let viewModel = viewModel else { return }
        characterStatusLabel.text = viewModel.getCharacterStatus()
    }
    
    private func setupCharacterSpeciesLabel() {
        guard let viewModel = viewModel else { return }
        characterSpeciesLabel.text = viewModel.getCharacterSpecies()
    }
    
    private func setupCharacterGenderLabel() {
        guard let viewModel = viewModel else { return }
        characterGenderLabel.text = viewModel.getCharacterGender()
    }
    
    private func setupCharacterLocationLabel() {
        guard let viewModel = viewModel else { return }
        characterLocationLabel.text = viewModel.getCharacterLocation()
    }
}
