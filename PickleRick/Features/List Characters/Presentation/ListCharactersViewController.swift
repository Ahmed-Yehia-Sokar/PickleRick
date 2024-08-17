//
//  ListCharactersViewController.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import UIKit

class ListCharactersViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - properties
    private let viewModel = ListCharactersViewModelProvider.provide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle()
        setupCollectionView()
        setupTableView()
        bindToDataSource()
        viewModel.listCharacters(errorHandler: listCharactersErrorHandler)
    }
    
    // MARK: - private methods
    private func setupNavigationBarTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Characters"
    }
    
    private func setupTableView() {
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterTableViewCell")
    }
    
    private func setupCollectionView() {
        collectionView.register(FilterCollectionCell.self, forCellWithReuseIdentifier: "FilterCollectionCell")
    }
    
    private func bindToDataSource() {
        viewModel.dataSource.bind { [weak self] dataSource in
            guard let unwrappedSelf = self else { return }
            if let dataSource = dataSource, !dataSource.isEmpty {
                unwrappedSelf.tableView.reloadData()
            }
        }
    }
    
    private func listCharactersErrorHandler(errorMessage: String) {
        let alert = UIAlertController(title: "Error",
                                      message: errorMessage,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ListCharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCharactersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath)
        guard let characterTableViewCell = tableCell as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        if let rmCharacter = viewModel.getRMCharacter(atIndex: indexPath.row) {
            characterTableViewCell.configure(with: rmCharacter)
        }
        
        return characterTableViewCell
    }
}

extension ListCharactersViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let tableView = scrollView as? UITableView {
            if scrollView.contentOffset.y > (tableView.contentSize.height - 50) - (scrollView.frame.size.height) {
                guard !viewModel.isPaginationOn else { return }
                
                viewModel.listCharacters(isPaginationOn: true,
                                                       errorHandler: listCharactersErrorHandler)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let rmCharacter = viewModel.getRMCharacter(atIndex: indexPath.row) {
            let viewModel = viewModel.getDisplayCharacterDetailsViewModel(selectedCharacter: rmCharacter)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "DisplayCharacterDetailsViewController")
            
            if let displayCharacterDetailsVC = viewController as? DisplayCharacterDetailsViewController {
                displayCharacterDetailsVC.configure(withViewModel: viewModel)
                navigationController?.pushViewController(displayCharacterDetailsVC, animated: true)
            }
        }
    }
}

extension ListCharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getFiltersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionCell", for: indexPath)
        guard let filterCollectionCell = collectionCell as? FilterCollectionCell else {
            return UICollectionViewCell()
        }
        let filterOption = viewModel.getFilter(atIndex: indexPath.row)
        
        filterCollectionCell.configure(with: filterOption)
        
        return filterCollectionCell
    }
}

extension ListCharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filterOption = viewModel.getFilter(atIndex: indexPath.row)
        
        viewModel.resetPagination()
        viewModel.listCharacters(filterOption: filterOption,
                                               errorHandler: listCharactersErrorHandler)
    }
}
