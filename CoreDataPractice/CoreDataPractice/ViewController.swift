//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 김윤홍 on 7/9/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  var container: NSPersistentContainer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") else {
      print("저장된 전화 번호 없음")
      return
    }

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    self.container = appDelegate.persistentContainer
    
    createData(name: "Adam", phoneNumber: "010-1234-5678")
    readData()
    updateData(currentName: "Adam", udateName: "yunhong")
    readData()
    deleteData(name: "yunhong")
    readData()
    
  }
  
  //=====================================================CoreDataPractice에 있는 데이터에 접근
  
  //CURD중 C
  
  func createData(name: String, phoneNumber: String) {
    guard let entity = NSEntityDescription.entity(forEntityName: PhoneBook.className, in: self.container.viewContext)
    else {return}
    let newPhoneBook = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
    newPhoneBook.setValue(name, forKey: PhoneBook.Key.name)
    newPhoneBook.setValue(phoneNumber, forKey: PhoneBook.Key.phoneNumber)
    print(name, phoneNumber)
    
    do {
      try self.container.viewContext.save()
      print("create성공")
    } catch {
      print("실패")
    }
  }
  
  func readData() {
    do {
      let phoneBooks = try self.container.viewContext.fetch(PhoneBook.fetchRequest())
      
      for phoneBook in phoneBooks as [NSManagedObject] {
        if let name = phoneBook.value(forKey: PhoneBook.Key.name) as? String,
           let phoneNumber = phoneBook.value(forKey: PhoneBook.Key.phoneNumber) {
          print("name: \(name), phoneNumber: \(phoneNumber)")
        }
      }
    } catch {
      print("실패")
    }
  }
  
  func updateData(currentName: String, udateName: String) {
    let fetchRequest = PhoneBook.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "name == %@", currentName)
    
    do {
      let result = try self.container.viewContext.fetch(fetchRequest)
      
      for data in result as [NSManagedObject] {
        data.setValue(udateName, forKey: PhoneBook.Key.name)
      }
      
      try self.container.viewContext.save()
      
      print("성공")
    } catch {
      print("실패")
    }
  }
  
  func deleteData(name: String) {
    
    let fetchRequest = PhoneBook.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "name == %@", name)
    
    do {
      let result = try self.container.viewContext.fetch(fetchRequest)
      
      for i in result as [NSManagedObject] {
        self.container.viewContext.delete(i)
      }
      try self.container.viewContext.save()
      
      print("데이터 삭제완료 ")
    } catch {
      print("데이터 삭제 실패")
    }
  }
}

