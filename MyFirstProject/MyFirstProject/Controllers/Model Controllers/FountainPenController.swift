//
//  FountainPenController.swift
//  MyFirstProject
//
//  Created by Esther on 10/16/22.
//

import Foundation
class FountainPenController {
    
    // MARK: - Singleton
    static let sharedInstance = FountainPenController()
    
    // MARK: - SOT
    var fountainPens: [FountainPen] = []
    
    // MARK: - CRUD
    // Create:
    /// Did not need to include all model parameters (ID) in func because it is assigned a default in the initializer on the model file
    func createPen(brandName: String, penName: String, nibSize: String, nibMaterial: String) {
        let pen = FountainPen(brandName: brandName, penName: penName, nibSize: nibSize, nibMaterial: nibMaterial)
        fountainPens.append(pen)
    }
    
    
    
} // End of Class
