//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by 김윤홍 on 8/8/24.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

  let observable = Observable.of(1,2,3,4)
  let label = UILabel()
  let relay = BehaviorRelay(value: "abc")
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(label)
    relay.accept("newValue")
    
    relay.subscribe(onNext: { value in
      print(value)
    })
    
    relay.accept("another Value")
    observable.subscribe(onNext: { value in
      print(value)
    })
    
    let subject = PublishSubject<String>()
    subject.onNext("Hello")
    subject.subscribe(onNext: { value in
      print(value)
    })
    
    subject.onNext("world")
    
    
    
    
    
    
    
    
  }


}

