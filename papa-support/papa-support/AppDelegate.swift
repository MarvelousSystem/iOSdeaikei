/*
 Firebase追加
*/


import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //起動時に生成する画面
    var myNavigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // myNavigationControllerの設定
        let first = MainTabController()
        myNavigationController = UINavigationController(rootViewController: first)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = myNavigationController
        self.window?.makeKeyAndVisible()
        // Firebase
        FirebaseApp.configure()
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    func applicationWillTerminate(_ application: UIApplication) {
    }
}

