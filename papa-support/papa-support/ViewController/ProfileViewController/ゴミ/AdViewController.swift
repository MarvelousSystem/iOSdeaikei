//
//  AdViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/01.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {
    
    var adTest: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        adTest = UILabel(frame: CGRect(x: 0, y: 0, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight - DeviceSize.tabBarHeight - DeviceSize.screenHeight * (1 / 4 + 1 / 7 * 4)))
        adTest.text = "ここに広告が表示されます"
        self.view.addSubview(adTest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
