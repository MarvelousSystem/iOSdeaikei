//
//  RegistrationViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/14.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    var nicknameTextField: UITextField!
    var telTextField: UITextField!
    var eMailTextField: UITextField!
    var areaTextField: UITextField!
    var sexTextField: UITextField!
    var birthDayTextField: UITextField!
    var passwordTextField: UITextField!
    var pushTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textField() {
        let const = self.view.bounds.width
        let const_2 = self.view.bounds.height
        telTextField = UITextField(frame: CGRect(x: const / 4, y: const_2 / 6, width: const / 2, height: 30))
        telTextField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(telTextField)
    }
}
