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
        Group(image: UIImage(named: "рен"), name: "Фан клуб Рен-ТВ"),
        Group(image: UIImage(named: "PS"), name: "PlayStation"),
        Group(image: UIImage(named: "нтв"), name: "Телеканал НТВ"),
        Group(image: UIImage(named: "pirate-station"), name: "Пиратская станция"),
        Group(image: UIImage(named: "radio-record"), name: "Радио Record"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
           searchBarGroup.addGestureRecognizer(hideKeyboardGesture)
        
        filteredGroup = groups

        // Do any additional setup after loading the view.
    }
    @objc func hideKeyboard() {
           self.searchBarGroup.endEditing(true)
       }
}
extension GroupViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            filteredGroup.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableGroupCell", for: indexPath) as! TableGroupCell
            
            let content = cell
            
            content.ImageGroup.image = filteredGroup[indexPath.row].image
            content.textGroup.text = filteredGroup[indexPath.row].name
            
            return cell
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

