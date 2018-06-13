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
        telTextField.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(telTextField)
    }
    // パスワードの入力画面
    func setPasswordTextField() {
        let const = self.view.bounds.width
        let const_2 = self.view.bounds.height
        passwordTextField = UITextField(frame: CGRect(x: const / 4, y: const_2 / 6 * 2, width: const / 2, height: 30))
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
    }
    // 送信ボタン
    func setButton() {
        let button_1: UIButton = UIButton()
        button_1.backgroundColor = UIColor.white
        button_1.frame = CGRect(x: 0, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight, width: Double(self.view.bounds.width), height: DeviceSize.tabBarHeight)
        button_1.setTitle("ログイン", for: UIControlState.normal)
        button_1.setTitleColor(UIColor.black , for: UIControlState.normal)
        button_1.addTarget(self, action: #selector(self.tapped), for: .touchUpInside)
        self.view.addSubview(button_1)
    }
    // ボタンがタップされたとき
    @objc func tapped() {
        self.telTextFieldString = String(self.telTextField.text!)
        self.passwordTextFieldString = self.passwordTextField.text!
        let passwordSha256: String = self.telTextFieldString.sha256
        let url: String = "https://papa.support/api/v1/login/?tel=\(self.telTextFieldString)&password=\(passwordSha256)"
        print(url)
        return
    }
}
