//
//  DeviceSize.swift
//  App01
//
//  Created by Miamoto on 2018/05/23.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import Foundation
import UIKit

class DeviceSize {
    static let bounds = UIScreen.main.bounds
    static let screenWidth = Double(UIScreen.main.bounds.size.width)
    static let screenHeight = Double(UIScreen.main.bounds.size.height)
    static let statusBarHeight = Double(UIApplication.shared.statusBarFrame.height)
    static let navigationbarHeight = Double(UINavigationController().navigationBar.frame.size.height)
    static let tabBarHeight = Double(UITabBarController().tabBar.frame.size.height)
}
