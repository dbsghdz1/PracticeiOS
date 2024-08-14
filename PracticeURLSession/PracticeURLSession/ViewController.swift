//
//  ViewController.swift
//  PracticeURLSession
//
//  Created by 김윤홍 on 7/17/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
  
  let webView = WKWebView()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.addSubview(webView)
    startLoad()
  }
  
  struct UserData: Codable {
    let id: Int
    let email: String
    let firstName = "first_name"
    let lastName = "last_name"
    let avatar: URL
  }
  
  func startLoad() {
    let url = URL(string: "https://reqres.in/api/users/1")!
    let task = URLSession.shared.dataTask(with: url) @escaping { data, response, error in
      if let error = error {
        print(error)
        return
      }
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        return
      }
      if let mimeType = httpResponse.mimeType, mimeType == "application/json",
         let data = data {
        do {
          let decoder = JSONDecoder()
          let resoponseData = try decoder.decode([String: UserData].self, from: data)
          if let userData = resoponseData["data"] {
            print(userData)
          }
        }
      }
      task.resume()
    }
  }
}
