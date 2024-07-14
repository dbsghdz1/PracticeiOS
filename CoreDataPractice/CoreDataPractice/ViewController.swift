//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by 김윤홍 on 7/13/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  private var models = [ToDoListItem]()
  
  var mainView: MainView!
  override func loadView() {
    mainView = MainView(frame: UIScreen.main.bounds)
    self.view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "ToDoList"
    getAllItems()
    mainView.tableView.delegate = self
    mainView.tableView.dataSource = self
    mainView.tableView.register(tableViewCell.self, forCellReuseIdentifier: tableViewCell.identifier)
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(buttonTapped))
  }
  
  @objc
  func buttonTapped() {
    let alert = UIAlertController(title: "title", message: "Message", preferredStyle: .alert)
    alert.addTextField(configurationHandler: nil)
    alert.addAction(UIAlertAction(title: "AlertActionSubmit", style: .cancel, handler: { _ in
      guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else { return }
      self.createItem(name: text)
    }))
    present(alert, animated: true)
  }
  
  func getAllItems() {
    do {
      
      models = try context.fetch(ToDoListItem.fetchRequest())
      
      DispatchQueue.main.async {
        self.mainView.tableView.reloadData()
      }
    } catch {
      
    }
  }
  
  func createItem(name: String) {
    let newItem = ToDoListItem(context: context)
    newItem.name = name
    newItem.createDate = Date()
    
    do {
      try context.save()
      getAllItems()
    } catch {
      
    }
  }
  
  func deleteItem(item: ToDoListItem) {
    context.delete(item)
    
    do {
      try context.save()
    } catch {
      
    }
  }
  
  func updateItem(item: ToDoListItem, newName: String) {
    item.name = newName
    do {
      try context.save()
    } catch {
      
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell.identifier, for: indexPath)
    let model = models[indexPath.row]
    var content = cell.defaultContentConfiguration()
    content.text = model.name
    content.secondaryText = "detail"
    content.image = UIImage(systemName: "swift")
    content.imageProperties.tintColor = .systemBlue
    cell.contentConfiguration = content
    
    if let imageView = cell.contentView.subviews.compactMap({ $0 as? UIImageView }).first {
      imageView.layer.cornerRadius = imageView.frame.size.width / 2
      imageView.layer.masksToBounds = true
      imageView.layer.borderWidth = 2
      imageView.layer.borderColor = UIColor.black.cgColor
    }
    cell.accessoryType = .none
    cell.selectionStyle = .blue
    cell.backgroundColor = .lightGray
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
    sheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
    sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: nil))
    sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
    }))
    present(sheet, animated: true)
  }
  
}

