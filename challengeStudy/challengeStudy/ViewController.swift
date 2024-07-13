//
//  ViewController.swift
//  challengeStudy
//
//  Created by 김윤홍 on 7/8/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var textField: UITextField!
  
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textField.delegate = self
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    label.text = textField.text
    view.backgroundColor = .cyan
    return true
  }
}

