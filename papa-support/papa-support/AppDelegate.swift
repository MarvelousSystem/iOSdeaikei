
import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // ログイン状態によってアプリ起動時の表示画面を分岐
        if (UserDefaults.standard.object(forKey: "LoginID") == nil || UserDefaults.standard.object(forKey: "Password") == nil) {
            // ログインをしていなければログイン画面へ
            let first = StartViewController()
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = first
        }
        else {
            // ログインをしていればアプリ画面へ
            let first = MainTabController()
            var myNavigationController: UINavigationController?
            myNavigationController = UINavigationController(rootViewController: first)
            myNavigationController?.navigationBar.barTintColor = UIColor.white
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = myNavigationController
        }
        self.window?.makeKeyAndVisible()
        // Firebase
        FirebaseApp.configure()
        // Notification
        if #available(iOS 10.0, *) {
            //ios10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                if granted {
                    debugPrint("通知許可")
                    center.delegate = self as? UNUserNotificationCenterDelegate
                    DispatchQueue.main.async(execute: {
                        UIApplication.shared.registerForRemoteNotifications()
                    })
                } else {
                    debugPrint("通知拒否")
                }
            })
        } else {
            // ios9
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        }
        return true
    }
    //リモート通知
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // そのままだと「32bit」という文字列なので以下の処理を行います
        let deviceTokenString: String = deviceToken.map { String(format: "%.2hhx", $0) }.joined()
        print("deviceTokenString \(deviceTokenString)")
        UserDefaults.standard.set(deviceTokenString, forKey: "deviceTokenString") // これは自前
    }
    //リモート通知を拒否したときの動作
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint("リモート通知の設定は拒否されました")
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

