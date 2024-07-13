//
//  AppDelegate.swift
//  challengeStudy
//
//  Created by 김윤홍 on 7/8/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    print("앱시작시 호출 실제로 화면이 보여지기 전에 호출 -> UIKit에 scene연결")
    return true
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    print("활성화 상태로 전환")
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    print("비활성 상태로 전환되기 전에 호출 일시정지, 중요한 데이터 저장")
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    print("앱이 백그라운드 상태로 전환된 후 호출됩니다, 백그라운드 시작")
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    print("Foreground상태로 전환되기 전에 작업")
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    print("앱이 종료되기 전에 호출 메모리에서 완전히 제거 되기전에 필요한 작업수행 - ex)데이터 저장")
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

