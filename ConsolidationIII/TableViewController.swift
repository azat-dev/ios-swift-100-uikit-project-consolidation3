//
//  TableViewController.swift
//  ConsolidationIII
//
//  Created by Azat Kaiumov on 23.05.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var shoppingList = [String]()
    
    func initNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        initNavigationBar()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListItem", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    func addItem(_ text: String) {
        shoppingList.insert(text, at: 0)
        let index = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [index], with: .automatic)
    }
    
    @objc func addButtonTapped() {
        let alert = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let addButton = UIAlertAction(title: "Add", style: .default) {
            [weak self, weak alert] _ in
            if let text = alert?.textFields?[0].text {
                self?.addItem(text)
            }
        }
        
        alert.addAction(addButton)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
}
