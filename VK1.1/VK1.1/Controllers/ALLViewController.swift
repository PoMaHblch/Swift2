//
//  ALLViewController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import UIKit

class ALLViewController: UIViewController {
    


    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = self
        }
    }
    
    var groups = [
        Group(image: UIImage.init(systemName: "globe.europe.africa"), name: "buldoZZers"),
        Group(image: UIImage.init(systemName: "beats.headphones"), name: "Deep House"),
        Group(image: UIImage.init(systemName: "figure.wave"), name: "Бла Бла Кар"),
        Group(image: UIImage.init(systemName: "scooter"), name: "Прокат самокатов"),
        Group(image: UIImage.init(systemName: "logo.playstation"), name: "PlayStation"),
        Group(image: UIImage.init(systemName: "fork.knife.circle"), name: "Доставка еды"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension ALLViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = groups[indexPath.row].name
        content.image = groups[indexPath.row].image
        cell.contentConfiguration = content
        
        return cell
    }
    
}
