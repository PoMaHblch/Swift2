//
//  TableController.swift
//  VK1.1
//
//  Created by Роман Турьянов on 12.04.2022.
//

import UIKit

class TableController: UITableViewController {
    
    @IBAction func addSelectedGrops(segue: UIStoryboardSegue) {
       if let sourceVC = segue.source as? TableGroupController,
          let index = sourceVC.tableView.indexPathForSelectedRow {
           let group = sourceVC.groups[index.row]
           
           if !groups.contains(where: {$0.name == group.name}) {
           groups.append(group)
           tableView.reloadData()
       }
       }
    }
    
    var groups = [
        Group(image: UIImage(named: "Group"), name: "Знакомства"),
        Group(image: UIImage(named: "Group"), name: "Кинопоиск"),
        Group(image: UIImage(named: "Group"), name: "БашДТП"),
        Group(image: UIImage(named: "Group"), name: "XboX"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellView", for: indexPath) as? TableCell else {
            preconditionFailure("error cell")
        }

        cell.CellText.text = groups[indexPath.row].name
        cell.CellImage.image = groups[indexPath.row].image
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
