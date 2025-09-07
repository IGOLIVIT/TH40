//
//  FieldworkViewModel.swift
//  TH40
//
//  Created by IGOR on 07/09/2025.
//

import SwiftUI
import CoreData

final class FieldworkViewModel: ObservableObject {
    
    @Published var statuses: [String] = ["In progress", "Completed", "Not completed"]
    @Published var curStatus: String = ""

    @Published var isAdd: Bool = false
    @Published var isAddSale: Bool = false
    @Published var isDelete: Bool = false

    @Published var isDeleteSale: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDetail: Bool = false
    @Published var isBack: Bool = false

    @Published var fTit: String = ""
    @Published var fLoc: String = ""
    @Published var fDescr: String = ""
    @Published var fDate: Date = Date()
    @Published var fTime: Date = Date()
   @Published var fStatus: String = ""

    @Published var fields: [FieldModel] = []
    @Published var selectedField: FieldModel?

    func addField() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FieldModel", into: context) as! FieldModel

        loan.fTit = fTit
        loan.fLoc = fLoc
        loan.fDescr = fDescr
        loan.fDate = fDate
        loan.fTime = fTime
        loan.fStatus = fStatus

        CoreDataStack.shared.saveContext()
    }

    func fetchFields() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FieldModel>(entityName: "FieldModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.fields = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.fields = []
        }
    }
}
