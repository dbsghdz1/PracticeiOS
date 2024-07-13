//
//  ViewController.swift
//  delegatePattern
//
//  Created by 김윤홍 on 7/4/24.
//

import UIKit

import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var label: UILabel!
  
  @IBOutlet weak var textField: UITextField!
  @IBAction func button(_ sender: UIButton) {
    label.text = textField.text
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.delegate = self
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    label.text = textField.text
    return true
  }

}

