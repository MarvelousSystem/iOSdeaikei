//
//  RegistrationOrLoginViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/13.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit
import Foundation

class RegistrationOrLoginViewController: UIViewController {

    // 文字列保存用の変数
    var telTextFieldString = ""
    var passwordTextFieldString = ""
    var telTextField: UITextField!
    var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        setTelTextField()
        setPasswordTextField()
        setButton()
        setRegisterButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = "ログイン"
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = " "
    }
    // ログインIDの入力画面
    func setTelTextField() {
        let const = self.view.bounds.width
        let const_2 = self.view.bounds.height
        telTextField = UITextField(frame: CGRect(x: const / 4, y: const_2 / 6, width: const / 2, height: 30))
        telTextField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(telTextField)
    }
    // パスワードの入力画面
    func setPasswordTextField() {
        let const = self.view.bounds.width
        let const_2 = self.view.bounds.height
        passwordTextField = UITextField(frame: CGRect(x: const / 4, y: const_2 / 6 * 2, width: const / 2, height: 30))
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
    }
    // 送信ボタン
    func setButton() {
        let button_1: UIButton = UIButton()
        button_1.backgroundColor = UIColor.white
        button_1.frame = CGRect(x: 0, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight, width: Double(self.view.bounds.width), height: DeviceSize.tabBarHeight)
        button_1.setTitle("ログイン", for: UIControl.State.normal)
        button_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_1.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button_1)
    }
    // 会員登録ボタン
    func setRegisterButton() {
        let button_2: UIButton = UIButton()
        button_2.backgroundColor = UIColor.white
        button_2.frame = CGRect(x: (DeviceSize.screenWidth - Double(self.view.bounds.width) / 4 * 3) / 2, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight * 8, width: Double(self.view.bounds.width) / 4 * 3, height: DeviceSize.tabBarHeight)
        button_2.setTitle("会員登録", for: UIControl.State.normal)
        button_2.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_2.addTarget(self, action: #selector(self.tapped_2), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button_2)
    }
    // ボタンがタップされたとき
    @objc func tapped() {
        self.telTextFieldString = String(self.telTextField.text!)
        self.passwordTextFieldString = self.passwordTextField.text!
        var success: Bool = false
        let passwordSha256: String = self.telTextFieldString.sha256
        var url: String = "https://papa.support/api/v1/login/?tel=\(self.telTextFieldString)&password=\(passwordSha256)"
        // テスト(テストアカウントでログインしているので注意)
        url = "https://papa.support/api/v1/login/?tel=09024643115&password=2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e730"
        let data: Data! = LoginModel.sendLoginInformationToServer(url: url)
        print(data)
        success = true
        // ログインに成功したらメイン画面へ
        if (success) {
            let first = MainTabController()
            var myNavigationController: UINavigationController?
            myNavigationController = UINavigationController(rootViewController: first)
            present(myNavigationController!, animated: true, completion: nil)
        } else {
            print("ログインに失敗しました")
        }
        return
    }
    @objc func tapped_2() {
        let registrationViewController = RegistrationViewController()
        present(registrationViewController, animated: true, completion: nil)
    }
}
