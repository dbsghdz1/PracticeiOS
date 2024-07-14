//
//  ToDoListItem+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by 김윤홍 on 7/13/24.
//
//

import Foundation
import CoreData

extension ToDoListItem {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
    return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
  }
  
  @NSManaged public var name: String?
  @NSManaged public var createDate: Date?
  
}
extension ToDoListItem : Identifiable {
}
