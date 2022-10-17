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
    
    // Initializer for FountainPenController file. the very first time we initialize, we load the persisting data
    init() {
        load()
    }
    
    // MARK: - CRUD
    // Create:
    /// Did not need to include all model parameters (ID) in func because it is assigned a default in the initializer on the model file
    func createPen(brandName: String, penName: String, nibSize: String, nibMaterial: String) {
        let pen = FountainPen(brandName: brandName, penName: penName, nibSize: nibSize, nibMaterial: nibMaterial)
        fountainPens.append(pen)
        
        save()
    }
    
    func updatePen(penToUpdate: FountainPen, updateBrandName: String, updatePenName: String, updateNibSize: String, updateNibMaterial: String) {
        penToUpdate.brandName = updateBrandName
        penToUpdate.penName = updatePenName
        penToUpdate.nibSize = updateNibSize
        penToUpdate.nibMaterial = updateNibMaterial
        
        save()
    }
    
    func deletePen(penToDelete: FountainPen) {
        guard let indexPenToDelete = fountainPens.firstIndex(of: penToDelete) else {return}
        fountainPens.remove(at: indexPenToDelete)
        
        save()
    }
    
    // MARK: - Persistance
    // Need the URL - which is a property. Source of truth - also a property
    // make it private because the other files ONLY NEED TO SEE the source of truth.. not the user's phone
    // if you open a scope after the type declaration, it is no longer a PROPERTY - it is now a COMPUTED PROPERTY: scope creates VALUE for the Computed Property
    private var fileURL: URL? {
        //.default is a singleton that Apple has created for the FileManager so we are always accessing the same one!
        /// Retrieve the first available  URL that is on the correct level to save user data -> within the users documents folder on their phone (standard location)
        /// "logs.json" is saving your source of truth into the data type that user's computer can read
        guard let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectoryURL.appendingPathComponent("fountainPens.json")
        return finalURL
    }
    
    // Need to save the URL
    // This code will always be the same except the name of the SOT
    func save() {
        // do we have a valid save location?
        guard let saveLocation = fileURL else {return}
        // convert the logs (SOT) into raw data (JSON)
        // if a call can THROW - you need to write a DO, TRY, CATCH (does by trying and will catch the error)
        do {
            // do this by TRY
            let data = try JSONEncoder().encode(fountainPens)
            // write the data to the url
            /// write(to:) is a throwing function
            try data.write(to: saveLocation)
        } catch let error {
            print(error)
        }
        
    }
    
    // Need to load from the URL
    func load() {
        guard let loadLocation = fileURL else {return}
        do {
            // initializing data from contents of given URL
            let data = try Data(contentsOf: loadLocation)
            let decodedPens = try JSONDecoder().decode([FountainPen].self, from: data)
            // use newly loaded data as your SOT, .self is how we defined the type
            self.fountainPens = decodedPens
        } catch let error {
            print(error)
        }
    }
    
} // End of Class
