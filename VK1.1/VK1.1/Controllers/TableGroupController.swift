//
//  TableGroupController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 17.04.2022.
//

import UIKit

class TableGroupController: UITableViewController, UISearchResultsUpdating {
    

    let groups = [(title: "buldoZZers", image: "Group"),
                   (title: "Deep House", image: "Group"),
                   (title: "Бла Бла Кар", image: "Group"),
                   (title: "Прокат самокатов", image: "Group"),
                   (title: "PlayStation", image: "Group"),
                   (title: "Фан клуб Рен ТВ", image: "Group"),
                   (title: "Диалоги о рыбалке", image: "Group")
    ]
        
        
    var searchResults : [(title: String, image: String)] = []
        
        let searchController = UISearchController(searchResultsController: nil)

        override func viewDidLoad() {
            super.viewDidLoad()
            
            searchController.searchResultsUpdater = self
            self.definesPresentationContext = true
            self.tableView.tableHeaderView = searchController.searchBar
        }
        
        func filterContent(for searchText: String) {
            searchResults = groups.filter({ (title: String, image: String) -> Bool in
                let match = title.range(of: searchText, options: .caseInsensitive)
                return match != nil})
        }
        
        func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text {
                filterContent(for: searchText)
                
                tableView.reloadData()
            }
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return searchController.isActive ? searchResults.count : groups.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let entry = searchController.isActive ?
                        searchResults[indexPath.row] : groups[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableCell
            cell.CellText?.text = entry.title
            cell.CellImage?.image = UIImage(named: entry.image)
            return cell
        }
  }
