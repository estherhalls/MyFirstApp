//
//  FountainPen.swift
//  MyFirstProject
//
//  Created by Esther on 10/16/22.
//

import Foundation
class FountainPen {
    var brandName: String
    var penName: String
    var nibSize: String
    var nibMaterial: String
    let id: UUID
    
    init(brandName: String, penName: String, nibSize: String, nibMaterial: String, id: UUID) {
        self.brandName = brandName
        self.penName = penName
        self.nibSize = nibSize
        self.nibMaterial = nibMaterial
        self.id = id
    }
} // end of class

extension FountainPen: Equatable {
    static func == (lhs: FountainPen, rhs: FountainPen) -> Bool {
        return lhs.id == rhs.id
    }
} // end of extension
