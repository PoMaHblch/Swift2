//
//  ListViewController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 19.04.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            
        }
    }
    
    var friend = [
        Friends(image: UIImage(named: "Avatar4"), name: "Генадий", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Тагир", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Разгильдар", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Айрат", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Василий", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Валя", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Антон", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Ильдар", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Айраз", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Расим", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Аля", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Яна", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Фарит", friends: newFrenchArray),
        Friends(image: UIImage(named: "Avatar4"), name: "Юля", friends: newFrenchArray),
    ]

    var sortedFriend = [Character: [Friends]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sortedFriend = sort(friend: friend)
     
        func numberOfSections(in tableView: UITableView) -> Int {
        
           return sortedFriend.keys.count
        }
        // Do any additional setup after loading the view.
    }
    
   
    
    private func sort(friend: [Friends]) -> [Character: [Friends]] {
        var friendDict = [Character: [Friends]]()
        
        friend.forEach() { friends in
            
            guard let firstChar = friends.name.first else {return}
            
            if var thisCharFriend = friendDict[firstChar] {
                thisCharFriend.append(friends)
                friendDict[firstChar] = thisCharFriend
            } else {
                friendDict[firstChar] = [friends]
            }
        }
        return friendDict
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Collections",
           let destination = segue.destination as? CollectionController,
           let IndexPath = tableView.indexPathForSelectedRow {
            destination.title = friend[IndexPath.row].name
            destination.arrayFriend = friend[IndexPath.row].friends
        }
    }
}

extension ListViewController: UITableViewDataSource {
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
       return sortedFriend.keys.count
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keysSorted = sortedFriend.keys.sorted()
        let friend = sortedFriend[keysSorted[section]]?.count ?? 0
        
        return friend
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! FriendCell
    
    let content = cell
    
    let firstChar = sortedFriend.keys.sorted()[indexPath.section]
    let friend = sortedFriend[firstChar]!
    let friends: Friends = friend[indexPath.row]
    
    
    content.friendText.text = friends.name
    content.friendImage.image = friends.image
    
    cell.contentConfiguration = content as? UIContentConfiguration
    

    return cell
    

   }
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      String(sortedFriend.keys.sorted()[section])
    }
    
}
  

