//
//  CollectionViewModel.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI
import CoreData

final class CollectionViewModel: ObservableObject {
    
    @Published var climats: [String] = ["Arid", "Continental", "Mediterranean", "Mountainous", "Subtropica", "Temperate", "Tropical"]
    @Published var curClim: String = "Select climate"
    
    @Published var species: [String] = ["Snake", "Lizard", "Amphibian"]
    @Published var curSpec: String = "Select species"

    @Published var isAdd: Bool = false
    @Published var isAddSale: Bool = false
    @Published var isDelete: Bool = false

    @Published var isDeleteSale: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDetail: Bool = false
    @Published var isBack: Bool = false

    @Published var cCName: String = ""
    @Published var cSpec: String = ""
    @Published var cLName: String = ""
    @Published var cDate: Date = Date()
    @Published var cTime: Date = Date()
   @Published var cLoc: String = ""
    @Published var cTemp: String = ""
    @Published var cHum: String = ""
    @Published var cClim: String = ""

    @Published var collrctions: [ColModel] = []
    @Published var selectedCol: ColModel?

    func addCol() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ColModel", into: context) as! ColModel

        loan.cCName = cCName
        loan.cSpec = cSpec
        loan.cLName = cLName
        loan.cDate = cDate
        loan.cLoc = cLoc
        loan.cTemp = cTemp
        loan.cHum = cHum
        loan.cClim = cClim
        loan.cTime = cTime

        CoreDataStack.shared.saveContext()
    }

    func fetchCols() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ColModel>(entityName: "ColModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.collrctions = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.collrctions = []
        }
    }
}
