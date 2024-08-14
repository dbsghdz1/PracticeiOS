//
//  ViewController.swift
//  PracticeMemoryLeak
//
//  Created by 김윤홍 on 7/30/24.
//

import UIKit

class ClassA {
  var x: ClassB?
}

class ClassB {
  var x: ClassA?
}

class ViewController: UIViewController {

  @IBAction func buttonTapped(_ sender: Any) {
    let classA = ClassA()
    let classB = ClassB()
    
    classA.x = classB
    classB.x = classA
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

