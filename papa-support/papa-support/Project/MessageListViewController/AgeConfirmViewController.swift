//
//  AgeConfirmViewController.swift
//  papa-support
//
//  Created by Ricky on 2018/07/23.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class AgeConfirmViewController: UIViewController {
    private let AlertView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setToolbarHidden(true, animated: true)
        Age_Confirm_Appered()
        // Do any additional setup after loading the view.
    }
    func Age_Confirm_Appered(){
        AlertView.frame = CGRect(x: 0, y: 0, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight)
        AlertView.backgroundColor = UIColor.darkGray
        
        let View = UIView()
        View.frame = CGRect(x: 0, y:0, width: CGFloat(DeviceSize.screenWidth/1.5), height: 320)
        View.backgroundColor = UIColor.white
        View.layer.position = AlertView.center
        
        let TopView = UIView()
        TopView.frame = CGRect(x: 0, y: 0, width: View.frame.width, height: 120)
        TopView.backgroundColor = UIColor.blue
        
        let ImageView = UIImageView()
        ImageView.frame = CGRect(x: TopView.frame.width/2.2, y: 10, width: 50, height: 45)
        ImageView.image = UIImage(named: "icon_bigg.png")
        
        let TopView_Label = UILabel()
        TopView_Label.frame = CGRect(x:0, y:ImageView.frame.maxY, width: View.frame.width, height: 50)
        TopView_Label.text = "年齢確認が必要です。"
        TopView_Label.textAlignment = NSTextAlignment.center
        TopView_Label.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        TopView_Label.textColor = UIColor.red
        
        TopView.addSubview(ImageView)
        TopView.addSubview(TopView_Label)
        
        View.addSubview(TopView)
        
        let ContentsLabel = UILabel()
        ContentsLabel.frame = CGRect(x:0, y: TopView.frame.maxY+10, width:  View.frame.width, height: 60)
        ContentsLabel.numberOfLines = 0
        ContentsLabel.textAlignment = NSTextAlignment.center
        let attribute : NSAttributedString = NSAttributedString(
            string: "簡単ステップでサクッと\n年齢確認を済ませましょう。",
            attributes:  [kCTFontAttributeName as NSAttributedString.Key: UIFont(name: "HiraKakuProN-W6", size: 20)!]
        )
        ContentsLabel.attributedText = attribute
        ContentsLabel.textColor = UIColor.black
        
        let TextView = UITextView()
        TextView.frame = CGRect(x:0, y: ContentsLabel.frame.maxY+10, width:  View.frame.width, height: 50)
        TextView.text = "お相手とのメッセージを行うためには\n法令によりれ年齢確認が必要となります。\n手続きはとても簡単です。"
        TextView.textAlignment = NSTextAlignment.center
        TextView.isEditable = false
        TextView.textColor = UIColor.black
        
        let InfoButton = UIButton()
        InfoButton.frame = CGRect(x:10, y: TextView.frame.maxY+10, width:  View.frame.width-20, height: 40)
        InfoButton.setTitle("詳しくみる", for: .normal)
        InfoButton.tintColor = UIColor.white
        InfoButton.backgroundColor = UIColor(hex:"66cdaa")
        InfoButton.addTarget(self, action: #selector(InfoButton_TAP(_ :)), for: .touchUpInside)
        
        View.addSubview(ContentsLabel)
        View.addSubview(TextView)
        View.addSubview(InfoButton)
        
        let CloseViewButton = UIButton()
        CloseViewButton.frame = CGRect(x:AlertView.frame.width/2.1, y: View.frame.maxY, width:  50, height: 50)
        CloseViewButton.setTitle("×", for: .normal)
        CloseViewButton.titleLabel!.font = UIFont(name: "Helvetica-Bold",size: CGFloat(60))
        CloseViewButton.tintColor = UIColor.white
        CloseViewButton.backgroundColor = UIColor.clear
        CloseViewButton.addTarget(self, action: #selector(CloseButton_TAP(_ :)), for: .touchUpInside)
        
        AlertView.addSubview(View)
        AlertView.addSubview(CloseViewButton)
        self.view.addSubview(AlertView)
        
    }
    @objc func InfoButton_TAP(_ under:UIButton){
        print("Infomation_appered")
    }
    
    @objc func CloseButton_TAP(_ under:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
}
