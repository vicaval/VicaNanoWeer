//
//  StorageCategory+CoreDataProperties.swift
//  VicaNanoWeer
//
//  Created by vica valencia on 26/04/22.
//
//

import Foundation
import CoreData


extension StorageCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StorageCategory> {
        return NSFetchRequest<StorageCategory>(entityName: "StorageCategory")
    }

    @NSManaged public var name: String?

}

extension StorageCategory : Identifiable {

}
