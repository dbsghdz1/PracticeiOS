//
//  Memo+CoreDataProperties.swift
//  UserDefaultsPractice
//
//  Created by 김윤홍 on 7/9/24.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var memo: String?

}

extension Memo : Identifiable {

}
