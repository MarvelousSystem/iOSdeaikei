//
//  EditProfileViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/27.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "プロフィール編集"
    }
    // viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.title = "プロフィール編集"
    }
    // viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.title = "プロフィール編集"
    }

}
