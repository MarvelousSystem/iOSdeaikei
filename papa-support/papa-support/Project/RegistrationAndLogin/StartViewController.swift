
import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setRegisterButton()
        setLoginButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // 会員登録ボタン
    func setRegisterButton() {
        let const: Double = 8 // <- 間隔を決める定数
        let registerButton: UIButton = UIButton()
        registerButton.backgroundColor = UIColor(hex: "7fffd4")
        registerButton.frame = CGRect(x: const / 2, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight - const, width: Double(self.view.bounds.width) / 3 * 2 - const, height: DeviceSize.tabBarHeight)
        registerButton.setTitle("パパサポをはじめる", for: UIControlState.normal)
        registerButton.setTitleColor(UIColor.white , for: UIControlState.normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        registerButton.layer.cornerRadius = 22
        registerButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        registerButton.setTitleColor(UIColor.gray, for: .highlighted)
        self.view.addSubview(registerButton)
    }
    // ログインボタン
    func setLoginButton() {
        let const: Double = 8 // <- 間隔を決める定数
        let loginButton: UIButton = UIButton()
        loginButton.backgroundColor = UIColor(hex: "f08080")
        loginButton.frame = CGRect(x: Double(self.view.bounds.width) / 3 * 2 + const / 2, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight - const, width: Double(self.view.bounds.width) / 3 * 1 - const, height: DeviceSize.tabBarHeight)
        loginButton.setTitle("ログイン", for: UIControlState.normal)
        loginButton.setTitleColor(UIColor.white , for: UIControlState.normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.layer.cornerRadius = 22
        loginButton.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        loginButton.setTitleColor(UIColor.gray, for: .highlighted)
        self.view.addSubview(loginButton)
    }
    // 会員登録ボタンが押されたとき
    @objc func tappedRegisterButton() {
        let registerViewController = RegisterViewController()
        present(registerViewController, animated: true, completion: nil)
    }
    // ログインボタンが押されたとき
    @objc func tappedLoginButton() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
}
