//
//  ConfirmationViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/04.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setButton()
        FirebaseSmsAuthentication.phoneAuthSend(phoneNumber: "08022465704")
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
        button.setTitleColor(UIColor.black , for: UIControlState.normal)
        button.setTitle("本人確認をする", for: UIControlState.normal)
        self.view.addSubview(button)
    }
    
    
}
