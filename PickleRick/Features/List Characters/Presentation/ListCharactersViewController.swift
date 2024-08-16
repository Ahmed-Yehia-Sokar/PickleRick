//
//  ListCharactersViewController.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import UIKit

class ListCharactersViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - properties
    private let listCharactersViewModel = ListCharactersViewModelProvider.provide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle()
        setupTableView()
        bindToDataSource()
        listCharactersViewModel.listCharacters(isPaginationOn: false,
                                               errorHandler: listCharactersErrorHandler)
    }
    
    // MARK: - private methods
    private func setupNavigationBarTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Characters"
    }
    
    private func setupTableView() {
        tableView.register(RMCharacterTableCell.self, forCellReuseIdentifier: "RMCharacterTableCell")
    }
    
    private func bindToDataSource() {
        listCharactersViewModel.dataSource.bind { [weak self] dataSource in
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
        listCharactersViewModel.getCharactersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "RMCharacterTableCell", for: indexPath)
        guard let rmCharacterTableCell = tableCell as? RMCharacterTableCell else {
            return UITableViewCell()
        }
        
        if let rmCharacter = listCharactersViewModel.getRMCharacter(atIndex: indexPath.row) {
            rmCharacterTableCell.configure(with: rmCharacter)
        }
        
        return rmCharacterTableCell
    }
}
