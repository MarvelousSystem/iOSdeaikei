//
//  ConfirmationViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/04.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit
import Firebase

class ConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = "本人確認"
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = " "
    }
    func setButton() {
        let button: UIButton!
        button = UIButton(frame: CGRect(x: 0, y: DeviceSize.screenHeight - DeviceSize.tabBarHeight, width: DeviceSize.screenWidth, height: DeviceSize.tabBarHeight))
        button.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button.setTitle("本人確認をする", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    @objc func tapped() {
        // 国番号 + 電話番号
        let phoneNumber: String = "+81" + "08022465704"
        FirebaseSmsAuthentication.phoneAuthSend(phoneNumber: phoneNumber)
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        if let verificationID = verificationID {
            print(verificationID)
        } else {
            print("error")
        }
        //PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
        //    if let error = error {
        //        print(error.localizedDescription)
        return
            // Sign in using the verificationID and the code sent to the user
            //
    }
}
