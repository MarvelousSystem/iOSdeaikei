//
//  RegistrationOrLoginViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/13.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class RegistrationOrLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
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

}
