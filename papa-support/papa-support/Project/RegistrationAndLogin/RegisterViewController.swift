//
//  RegisterViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/14.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // 文字列保存用の変数
    var nicknameTextFieldString = ""
    var nicknameTextField: UITextField!
    var phoneNumberFieldString = ""
    var phoneNumberTextField: UITextField!
    var mailFieldString = ""
    var mailTextField: UITextField!
    var passwordFieldString = ""
    var passwordTextField: UITextField!
    var birthDateTextFieldString = ""
    var birthDateTextField: UITextField!
    let inputDatePicker = UIDatePicker() //<- DatePicker
    let nowDate = NSDate()
    let dateFormat = DateFormatter()
    var sexTextFieldString = ""
    var sexTextField: UITextField!
    var sexPickerView: UIPickerView!
    var sexDataList = ["","男", "女"]
    var prefecturesTextFieldString = ""
    var prefecturesTextField: UITextField!
    var prefecturesPickerView: UIPickerView!
    var prefecturesDataList = ["","北海道", "青森県", "岩手県", "宮城県", "秋田県",
                               "山形県", "福島県", "茨城県", "栃木県", "群馬県",
                               "埼玉県", "千葉県", "東京都", "神奈川県", "新潟県",
                               "富山県", "石川県", "福井県", "山梨県", "長野県",
                               "岐阜県", "静岡県", "愛知県", "三重県", "滋賀県",
                               "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
                               "鳥取県", "島根県", "岡山県", "広島県", "山口県",
                               "徳島県", "香川県", "愛媛県", "高知県", "福岡県",
                               "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県",
                               "鹿児島県", "沖縄県"]
    // 位置を統一するための変数
    let const: Double = DeviceSize.screenWidth / 20
    let const_height: Double = DeviceSize.screenHeight / 20
    let const_width: Double = DeviceSize.screenWidth / 20 * 18
    //UIScrollViewのインスタンス作成
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //scrollViewの大きさを設定。viewと同じサイズ
        scrollView.frame = self.view.frame
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:self.view.frame.width, height:self.view.frame.height * 1.5)
        setMainLabel()
        nickname()
        phoneNumber()
        password()
        mail()
        birthDate()
        sex()
        prefectures()
        self.view.addSubview(scrollView)
        // 送信ボタン
        setSendButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // ラベル
    func setMainLabel() {
        let mainLabel: UILabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 10, width: DeviceSize.screenWidth - const * 2, height: const * 3))
        mainLabel.text = "プロフィール登録"
        mainLabel.font = UIFont.boldSystemFont(ofSize: 40)
        scrollView.addSubview(mainLabel)
    }
    // 登録情報送信ボタン
    func setSendButton() {
        let const: Double = 8 // <- 間隔を決める定数
        let sendButton: UIButton = UIButton()
        sendButton.backgroundColor = UIColor(hex: "7fffd4")
        sendButton.frame = CGRect(x: const / 2, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight - const, width: Double(self.view.bounds.width) - const, height: DeviceSize.tabBarHeight)
        sendButton.setTitle("今すぐパパサポをはじめる", for: UIControl.State.normal)
        sendButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        sendButton.layer.cornerRadius = 22
        sendButton.addTarget(self, action: #selector(self.tappedSendButton), for: UIControl.Event.touchUpInside)
        sendButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        self.view.addSubview(sendButton)
    }
    // 登録情報送信ボタンが押されたとき
    @objc func tappedSendButton() {
        // DeviceToken（String）の取得
        var deviceTokenString: String!
        if (UserDefaults.standard.string(forKey: "deviceTokenString") == nil) {
            deviceTokenString = ""
        } else {
            deviceTokenString = UserDefaults.standard.string(forKey: "deviceTokenString") //<- appDelegate.swiftで保存しておいたdeviceToken
        }
        // CSRFの取得
        let csrf = GetCSRF.getCSRF()
        if (csrf == "error") {return}
        // サーバーに送信するURLを生成する
        var url: String = "https://papa.support/api/v1/register/?nickname=\(self.nicknameTextFieldString)&tel=\(self.phoneNumberFieldString)&mail=&\(self.mailFieldString)area=13&sex=m&birth_day=\(self.birthDateTextFieldString)&password=\(self.passwordFieldString)&device_token=\(deviceTokenString)&firebase_uid=testuid&csrf=\(csrf)"
        
        // 画面遷移
        let first = MainTabController()
        //var myNavigationController: UINavigationController?
        //myNavigationController = UINavigationController(rootViewController: first)
        //myNavigationController?.navigationBar.barTintColor = UIColor.white
        present(first, animated: true, completion: nil)
    }
    // ニックネーム
    func nickname() {
        // 宣言
        let nicknameLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4, width: const_width, height: const_height))
        nicknameTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height, width: const_width, height: const_height))
        // 設定
        nicknameLabel.text = "ニックネーム"
        nicknameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nicknameTextField.layer.borderWidth = 1
        nicknameTextField.layer.borderColor = UIColor.gray.cgColor
        scrollView.addSubview(nicknameLabel)
        scrollView.addSubview(nicknameTextField)
    }
    // 電話番号
    func phoneNumber() {
        // 宣言
        let phoneNumberLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 3, width: const_width, height: const_height))
        phoneNumberTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 4, width: const_width, height: const_height))
        // 設定
        phoneNumberLabel.text = "電話番号(ハイフンなし 例:09011112222)"
        phoneNumberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.borderColor = UIColor.gray.cgColor
        scrollView.addSubview(phoneNumberLabel)
        scrollView.addSubview(phoneNumberTextField)
    }
    // メールアドレス
    func mail() {
        // 宣言
        let mailLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 6, width: const_width, height: const_height))
        mailTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 7, width: const_width, height: const_height))
        // 設定
        mailLabel.text = "メールアドレス（任意）"
        mailLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mailTextField.layer.borderWidth = 1
        mailTextField.layer.borderColor = UIColor.gray.cgColor
        scrollView.addSubview(mailLabel)
        scrollView.addSubview(mailTextField)
    }
    // パスワード
    func password() {
        // 宣言
        let passwordLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 9, width: const_width, height: const_height))
        passwordTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 10, width: const_width, height: const_height))
        // 設定
        passwordLabel.text = "パスワード（半角英数）"
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 20)
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.isSecureTextEntry = true
        scrollView.addSubview(passwordLabel)
        scrollView.addSubview(passwordTextField)
    }
    // 生年月日
    func birthDate() {
        // 宣言
        let birthDateLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 12, width: const_width, height: const_height))
        birthDateTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 13, width: const_width, height: const_height))
        // 設定
        birthDateLabel.text = "生年月日"
        birthDateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        birthDateTextField.layer.borderWidth = 1
        birthDateTextField.layer.borderColor = UIColor.gray.cgColor
        scrollView.addSubview(birthDateLabel)
        scrollView.addSubview(birthDateTextField)
        // DatePickerの設定
        inputDatePicker.datePickerMode = UIDatePicker.Mode.date
        inputDatePicker.backgroundColor = UIColor.white
        birthDateTextField.inputView = inputDatePicker //<- セット
        // キーボードに表示するツールバーの表示
        let pickerToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.height - inputDatePicker.bounds.height - 40, width: self.view.bounds.width, height: 40))
        pickerToolBar.tintColor = UIColor.white
        pickerToolBar.backgroundColor = UIColor.white
        let spaceBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: Selector(("spaceBarButtonPush"))) //<- 何もないボタン
        let toolBarButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(RegisterViewController.toolBarButtonPush)) //<- 完了ボタン
        toolBarButton.tintColor = UIColor.blue
        pickerToolBar.items = [spaceBarButton, toolBarButton]
        birthDateTextField.inputAccessoryView = pickerToolBar //<- セット
        // 日付フィールドの設定
        dateFormat.dateFormat = "yyyy-MM-dd"
    }
    // ツールバーボタンが押されたとき
    @objc func toolBarButtonPush() {
        let pickerDate = inputDatePicker.date
        birthDateTextField.text = dateFormat.string(from: pickerDate)
        self.view.endEditing(true)
        return
    }
    // 性別
    func sex() {
        // 宣言
        let sexLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 15, width: const_width, height: const_height))
        sexTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 16, width: const_width, height: const_height))
        // 設定
        sexLabel.text = "性別"
        sexLabel.font = UIFont.boldSystemFont(ofSize: 20)
        sexTextField.layer.borderWidth = 1
        sexTextField.layer.borderColor = UIColor.gray.cgColor
        scrollView.addSubview(sexLabel)
        scrollView.addSubview(sexTextField)
        // pickerViewの設定
        let pickerView = UIPickerView()
        sexPickerView = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height - pickerView.bounds.height, width: self.view.bounds.width, height:pickerView.bounds.height))
        sexPickerView.dataSource = self
        sexPickerView.delegate = self
        let sexToolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.height - pickerView.bounds.height - 40, width: self.view.bounds.width, height: 40))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(RegisterViewController.sexDone))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(RegisterViewController.sexCancel))
        sexToolBar.setItems([cancelItem, doneItem], animated: true)
        sexTextField.inputAccessoryView = sexToolBar
        sexTextField.inputView = sexPickerView
    
    }
    // 都道府県
    func prefectures() {
        // 宣言
        let prefecturesLabel = UILabel(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 18, width: const_width, height: const_height))
        prefecturesTextField = UITextField(frame: CGRect(x: const, y: DeviceSize.screenHeight / 4 + const_height * 19, width: const_width, height: const_height))
        // 設定
        prefecturesLabel.text = "都道府県"
        prefecturesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        prefecturesTextField.layer.borderWidth = 1
        prefecturesTextField.layer.borderColor = UIColor.gray.cgColor
        scrollView.addSubview(prefecturesLabel)
        scrollView.addSubview(prefecturesTextField)
        // pickerViewの設定
        let pickerView = UIPickerView()
        prefecturesPickerView = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height - pickerView.bounds.height, width: self.view.bounds.width, height: pickerView.bounds.height))
        prefecturesPickerView.dataSource = self
        prefecturesPickerView.delegate = self
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.height - pickerView.bounds.height - 40, width: self.view.bounds.width, height: 40))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(RegisterViewController.prefecturesDone))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(RegisterViewController.prefecturesCancel))
        toolBar.setItems([cancelItem, doneItem], animated: true)
        prefecturesTextField.inputView = prefecturesPickerView
        prefecturesTextField.inputAccessoryView = toolBar
    }
}

extension RegisterViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == sexPickerView {
            return sexDataList.count
        }
        return prefecturesDataList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == sexPickerView {
            return sexDataList[row]
        }
        return prefecturesDataList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == sexPickerView {
            sexTextField.text = sexDataList[row]
        }
        prefecturesTextField.text = prefecturesDataList[row]
    }
    @objc func sexCancel() {
        sexTextField.text = ""
        sexTextField.endEditing(true)
    }
    @objc func sexDone() {
        sexTextField.endEditing(true)
    }
    @objc func prefecturesCancel() {
        prefecturesTextField.text = ""
        prefecturesTextField.endEditing(true)
    }
    @objc func prefecturesDone() {
        prefecturesTextField.endEditing(true)
    }
}
