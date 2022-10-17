//
//  penTableViewCell.swift
//  MyFirstProject
//
//  Created by Esther on 10/14/22.
//

import UIKit

class penTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var penBrandModelNamesLabel: UILabel!
    @IBOutlet weak var nibSizeMaterialLabel: UILabel!
    
    // Call this method in table view conteroller when building UI of the cell
    func configureCell(with pen: FountainPen) {
        penBrandModelNamesLabel.text = "\(pen.brandName)\(pen.penName)"
        nibSizeMaterialLabel.text = "\(pen.nibSize), \(pen.nibMaterial)"
    }
    
} // End of Class
