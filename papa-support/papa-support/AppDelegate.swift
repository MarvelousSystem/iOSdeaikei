
import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // ログイン状態によってアプリ起動時の表示画面を分岐
        if (UserDefaults.standard.object(forKey: "LoginID") == nil || UserDefaults.standard.object(forKey: "Password") == nil) {
            // ログインをしていなければログイン画面へ
            let first = RegistrationOrLoginViewController()
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = first
        } else {
            // ログインをしていればアプリ画面へ
            let first = MainTabController()
            var myNavigationController: UINavigationController?
            myNavigationController = UINavigationController(rootViewController: first)
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = myNavigationController
        }
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

