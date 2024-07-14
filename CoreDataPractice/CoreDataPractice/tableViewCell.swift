//
//  tableViewCell.swift
//  CoreDataPractice
//
//  Created by 김윤홍 on 7/13/24.
//

import UIKit

class tableViewCell: UITableViewCell {
  static let identifier = "cell"
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
