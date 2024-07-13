//
//  ViewController.swift
//  UserDefaultsPractice
//
//  Created by 김윤홍 on 7/9/24.
//

import UIKit

import SnapKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    [label, textField, button].forEach { view.addSubview($0) }
    configureUI()
    // Do any additional setup after loading the view.
  }
  
  private let label: UILabel = {
    let label = UILabel()
    label.text = "포스트잇"
    label.font = .boldSystemFont(ofSize: 30)
    return label
  }()
  
  private let textField: UITextField = {
    let textField = UITextField()
    textField.text = Memo.memo
    textField.font = .boldSystemFont(ofSize: 40)
    textField.backgroundColor = .green
    return textField
  }()
  
  private let button: UIButton = {
    let button = UIButton()
    button.backgroundColor = .red
    button.setTitle("적용", for: .normal)
    return button
  }()
  
  func configureUI() {
    label.snp.makeConstraints {
      $0.top.equalToSuperview().inset(100)
    }
    
    textField.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(100)
      $0.width.height.equalTo(300)
    }
    
    button.snp.makeConstraints {
      $0.top.equalTo(textField.snp.bottom).inset(100)
      $0.width.height.equalTo(100)
    }
  }

}

