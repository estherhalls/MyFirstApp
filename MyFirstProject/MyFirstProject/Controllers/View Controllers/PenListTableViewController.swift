//
//  PenListTableViewController.swift
//  MyFirstProject
//
//  Created by Esther on 10/16/22.
//

import UIKit

class PenListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FountainPenController.sharedInstance.fountainPens.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// set reuse identifier and cell typcasted type as set on storyboard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toDetailVC", for: indexPath) as? penTableViewCell else { return UITableViewCell() }
        /// use indexPath from the row to find which pen should be displayed
        let pen = FountainPenController.sharedInstance.fountainPens[indexPath.row]
        /// Call the build cell method from the custom cell file
        cell.configureCell(with: pen)
        /// pass fully configured cell to be displayed
        return cell
    }
    
    /// This method is called when user swipes to delete a row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pen = FountainPenController.sharedInstance.fountainPens[indexPath.row]
            FountainPenController.sharedInstance.deletePen(penToDelete: pen)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? PenDetailViewController {
                    let penToSend = FountainPenController.sharedInstance.fountainPens[index.row]
                    destination.penReceiver = penToSend
                }
            }
        }
    }
    
    
}
