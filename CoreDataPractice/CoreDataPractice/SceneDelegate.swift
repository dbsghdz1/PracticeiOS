//
//  SceneDelegate.swift
//  CoreDataPractice
//
//  Created by 김윤홍 on 7/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = scene as? UIWindowScene else { return }
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = UINavigationController(rootViewController: ViewController())
    window.makeKeyAndVisible()
    self.window = window
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
  }
}

