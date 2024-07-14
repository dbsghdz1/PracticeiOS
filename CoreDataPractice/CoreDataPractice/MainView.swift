//
//  MainView.swift
//  CoreDataPractice
//
//  Created by 김윤홍 on 7/13/24.
//

import UIKit

import SnapKit

class MainView: UIView {
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureUI() {
    [
      tableView
    ].forEach { self.addSubview($0) }
  }
  
  func setConstraints() {
    
    tableView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(200)
      make.leading.trailing.equalToSuperview().inset(20)
      make.bottom.equalToSuperview().inset(20)
    }
  }
}
