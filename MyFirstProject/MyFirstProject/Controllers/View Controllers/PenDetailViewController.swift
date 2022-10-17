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

        // Do any additional setup after loading the view.
    }
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
