//
//  MatchingSearchViewController.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/25.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class MatchingSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "検索条件"
        setButtonView()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.title = "検索条件"
    }
    // buttonView(buttonを綺麗に乗せるためのView、viewDidLoadで実行することにより機能)
    func setButtonView() {
        let buttonView: UIView = UIView(frame: CGRect(x: 0, y: self.view.bounds.height - CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight / 2), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight / 2)))
        buttonView.backgroundColor = UIColor.white
        self.view.addSubview(buttonView)
        // 定数
        let const: CGFloat = CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight) / 8
        // button
        let likeButton: UIButton = UIButton(frame: CGRect(x: 0 + const, y: const + self.view.bounds.height - buttonView.bounds.height, width: buttonView.bounds.width / 7 * 3 - const * 1, height: buttonView.bounds.height - const * 2))
        likeButton.backgroundColor = UIColor.white
        likeButton.layer.borderColor = UIColor.black.cgColor
        likeButton.layer.borderWidth = 1.0
        likeButton.setTitle("条件をリセット", for: UIControl.State.normal)
        likeButton.setTitleColor(UIColor.black , for: UIControl.State.normal)
        likeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        likeButton.layer.cornerRadius = 5
        likeButton.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(likeButton)
        // button
        let messageButton: UIButton = UIButton(frame: CGRect(x: const + buttonView.bounds.width / 7 * 3, y: self.view.bounds.height - buttonView.bounds.height + const, width: buttonView.bounds.width / 7 * 4 - const * 2, height: buttonView.bounds.height - const * 2))
        messageButton.backgroundColor = UIColor(hex: "7fffd4")
        messageButton.setTitle("この条件で検索", for: UIControl.State.normal)
        messageButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        messageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        messageButton.layer.cornerRadius = 5
        messageButton.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(messageButton)
    }
    @objc func tapped() {
        return
    }

}
