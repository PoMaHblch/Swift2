//
//  GroupViewController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 24.04.2022.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    var filteredGroup = [Group]()
    
    @IBOutlet var searchBarGroup: UISearchBar! {
        didSet {
            searchBarGroup.delegate = self
        }
    }
    
    var groups = [
        Group(image: UIImage(named: "знакомства"), name: "Знакомства"),
        Group(image: UIImage(named: "кинопоиск"), name: "Кинопоиск"),
        Group(image: UIImage(named: "башдтп"), name: "БашДТП"),
        Group(image: UIImage(named: "Друг"), name: "Друг вокруг"),
        Group(image: UIImage(named: "Group"), name: "Олеги Литвы"),
        Group(image: UIImage(named: "Group"), name: "PlayStation"),
        Group(image: UIImage(named: "Group"), name: "Олеги"),
        Group(image: UIImage(named: "Group"), name: "Литвы"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListXIBTableViewCell", bundle: nil), forCellReuseIdentifier: "ListXIBTableCell")
        
        filteredGroup = groups

        // Do any additional setup after loading the view.
    }
}
extension GroupViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            filteredGroup.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListXIBTableCell", for: indexPath) as! ListXIBTableViewCell
            
            let content = cell
            
            content.listImageView.image = filteredGroup[indexPath.row].image
            content.listNameLabel.text = filteredGroup[indexPath.row].name
            
            return cell
        }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPrth: IndexPath) {
      performSegue(withIdentifier: "groupss", sender: nil)
  }
    }
extension GroupViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredGroup = groups
        }else {
            filteredGroup = groups.filter {$0.name.contains(searchText)}
        }
        tableView.reloadData()
    }
}

