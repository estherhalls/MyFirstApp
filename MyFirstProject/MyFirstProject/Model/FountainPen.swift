//
//  FountainPen.swift
//  MyFirstProject
//
//  Created by Esther on 10/16/22.
//

import Foundation
class FountainPen: Codable {
    var brandName: String
    var penName: String
    var nibSize: String
    var nibMaterial: String
    let id: UUID
    
    init(brandName: String, penName: String, nibSize: String, nibMaterial: String, id: UUID = UUID()) {
        self.brandName = brandName
        self.penName = penName
        self.nibSize = nibSize
        self.nibMaterial = nibMaterial
        self.id = id
    }
} // end of class

/// extending the FountainPen class to adopt and conform to the equatable protocol to give a way for cell entries to compare themselves to other entries in order for us to index and delete in model controller
extension FountainPen: Equatable {
    static func == (lhs: FountainPen, rhs: FountainPen) -> Bool {
        return lhs.id == rhs.id
    }
} // end of extension
