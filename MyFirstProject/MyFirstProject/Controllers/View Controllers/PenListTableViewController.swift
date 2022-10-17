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
        /// Tableview to scale cell height to its content
        tableView.rowHeight = UITableView.automaticDimension
        /// estimated height to start calculating from
        tableView.estimatedRowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// When the table view displays after user presses save/delete on detail view and it navigates back
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FountainPenController.sharedInstance.fountainPens.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// set reuse identifier and cell typcasted type as set on storyboard
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "penCell", for: indexPath) as? penTableViewCell else { return UITableViewCell() }
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
