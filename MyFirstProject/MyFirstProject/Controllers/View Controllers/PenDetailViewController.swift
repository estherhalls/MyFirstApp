//
//  PenDetailViewController.swift
//  MyFirstProject
//
//  Created by Esther on 10/16/22.
//

import UIKit

class PenDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var penBrandTextField: UITextField!
    @IBOutlet weak var penNameTextField: UITextField!
    @IBOutlet weak var nibSizeTextField: UITextField!
    @IBOutlet weak var nibMaterialTextField: UITextField!
    
    // Receiver:
    var penReceiver: FountainPen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Helper Functions
    /// ensures valid pen entry to display. If guard statement passes, we display data of that pen. If it does not, the user is trying to create a new pen entry and no data should be displayed
    func updateUI() {
        guard let pen = penReceiver else { return }
        penBrandTextField.text = pen.brandName
        penNameTextField.text = pen.penName
        nibSizeTextField.text = pen.nibSize
        nibMaterialTextField.text = pen.nibMaterial
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        /// is there text to save?
        guard let brandName = penBrandTextField.text,
              let penName = penNameTextField.text,
              let nibSize = nibSizeTextField.text,
              let nibMaterial = nibMaterialTextField.text
        else { return }
        /// does pen have a valid value?
        if let pen = penReceiver {
            /// HAS value - user is trying to update an existing set of pen data. Use update function from model controller
            FountainPenController.sharedInstance.updatePen(penToUpdate: pen, updateBrandName: brandName, updatePenName: penName, updateNibSize: nibSize, updateNibMaterial: nibMaterial)
        } else {
            /// DOES NOT HAVE value - user is creating a new submission of data. Use create function from model controller.
            FountainPenController.sharedInstance.createPen(brandName: brandName, penName: penName, nibSize: nibSize, nibMaterial: nibMaterial)
        }
        /// Send us back to the TableViewController view because user is finished with the detail view
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if let pen = penReceiver {
            FountainPenController.sharedInstance.deletePen(penToDelete: pen)
        }
        navigationController?.popViewController(animated: true)
    }
    
} // End of Class
