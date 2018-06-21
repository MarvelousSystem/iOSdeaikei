


import UIKit

// MARK: vars and lifecycle
class LoginViewController: UIViewController {

    // Vars
    var loginIDTextField: UITextField!
    var loginIDTextFieldString: String!
    var passwordTextField: UITextField!
    var passwordTextFieldString: String!
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUI()
        setSendLoginInformationButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // SetUI
    func setUI() {
        // vars
        let const: CGFloat = 25 //<- 入力フォームのサイズ
        let loginIDLabel = UILabel(frame: CGRect(x: CGFloat(DeviceSize.screenWidth / 6), y: CGFloat(DeviceSize.screenHeight / 8 * 2) - const * 2, width: CGFloat(DeviceSize.screenWidth / 6 * 4), height: const))
        loginIDTextField = UITextField(frame: CGRect(x: CGFloat(DeviceSize.screenWidth / 6), y: CGFloat(DeviceSize.screenHeight / 8 * 2) - const, width: CGFloat(DeviceSize.screenWidth / 6 * 4), height: const))
        let passwordLabel = UILabel(frame: CGRect(x: CGFloat(DeviceSize.screenWidth / 6), y: CGFloat(DeviceSize.screenHeight / 8 * 3) - const * 2, width: CGFloat(DeviceSize.screenWidth / 6 * 4), height: const))
        passwordTextField = UITextField(frame: CGRect(x: CGFloat(DeviceSize.screenWidth / 6), y: CGFloat(DeviceSize.screenHeight / 8 * 3) - const, width: CGFloat(DeviceSize.screenWidth / 6 * 4), height: const))
        // settings
        loginIDLabel.text = "携帯電話番号（例:09011112222）"
        loginIDLabel.font = UIFont.boldSystemFont(ofSize: 18)
        loginIDTextField.layer.borderWidth = 1
        loginIDTextField.layer.borderColor = UIColor.gray.cgColor
        passwordLabel.text = "パスワード（半角英数）"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 18)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        // add
        self.view.addSubview(loginIDLabel)
        self.view.addSubview(loginIDTextField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordTextField)
    }
    
    // SendLoginInformationButton
    func setSendLoginInformationButton() {
        let const: Double = 8 // <- 定数
        let sendLoginInformationButtonButton: UIButton = UIButton()
        sendLoginInformationButtonButton.backgroundColor = UIColor(hex: "f08080")
        sendLoginInformationButtonButton.frame = CGRect(x: const / 2, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight - const, width: Double(self.view.bounds.width) - const, height: DeviceSize.tabBarHeight)
        sendLoginInformationButtonButton.setTitle("ログインする", for: UIControlState.normal)
        sendLoginInformationButtonButton.setTitleColor(UIColor.white , for: UIControlState.normal)
        sendLoginInformationButtonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        sendLoginInformationButtonButton.layer.cornerRadius = 22
        sendLoginInformationButtonButton.addTarget(self, action: #selector(self.tappedSendLoginInformationButton), for: .touchUpInside)
        sendLoginInformationButtonButton.setTitleColor(UIColor.gray, for: .highlighted)
        self.view.addSubview(sendLoginInformationButtonButton)
    }
    @objc func tappedSendLoginInformationButton() {
        let csrf = GetCSRF.getCSRF() // <- csrf
        if (csrf == "error") {print("csrfの取得に失敗しました")}
        else {
            // test
            let element: String = "mvl0716"
            let element2: String = element.sha256
            let url2: String = "https://papa.support/api/v1/login/?tel=09024643115&password=\(element2)&csrf=\(csrf)"
            print(url2)
            GetLoginInformation.get(url: url2)
        }
    }
    
}
