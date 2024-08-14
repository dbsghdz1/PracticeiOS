//
//  ViewController.swift
//  PracticeRxSwift
//
//  Created by 김윤홍 on 8/14/24.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
//    let number = BehaviorSubject<Int>(value: 4)
//    
//    number
//      .subscribe { value in
//        print(value)
//      } onCompleted: {
//        print("complete")
//      }.disposed(by: disposeBag)
//    
//    number.onNext(7)
//    number.on(.next(9))
//    number.on(.completed)
    
    let number = PublishSubject<Int>()
    
    number.onNext(1)
    number.onNext(2)
    
    number
      .subscribe { value in
        print(value)
      } onError: { error in
        print(error)
      } onCompleted: {
        print("complete")
      } onDisposed: {
        print("disposed")
      }.disposed(by: disposeBag)
    
    number.onNext(3)
    number.onNext(4)
    number.on(.next(5))
    number.onCompleted()
  }
}

