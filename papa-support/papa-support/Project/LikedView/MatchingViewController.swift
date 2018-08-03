//
//  MatchingViewController.swift
//  papa-support
//
//  Created by Ricky on 2018/07/25.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class MatchingViewController: UIViewController,UINavigationControllerDelegate {
    open var adavterImage:UIImage!
    open var adavterName:String!
    open var selfImage:UIImage!
    open var ViewisHidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setView()
    }
    
    func setView(){
        
        let View = UIView()
        View.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        View.layer.position = self.view.center
        View.backgroundColor = UIColor.white
        
        let Label = UILabel()
        Label.frame = CGRect(x: 0, y: 0, width: View.frame.width, height: View.frame.height/5)
        Label.numberOfLines = 0
        Label.textAlignment = NSTextAlignment.center
        Label.attributedText = setFontAttribute(Message: "マッチング\nおめでとうございます！", Size: 22)
        Label.textColor = UIColor.black
        View.addSubview(Label)
        
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: Label.frame.maxY, width: View.frame.width, height: View.frame.height/5)
        textView.attributedText = setFontAttribute(Message:"\(adavterName!)さんもあなたに\n興味があるようです。\n早速メッセージを送りましょう。" , Size: 12)
        textView.textAlignment = NSTextAlignment.center
        View.addSubview(textView)
        
        let selfImageView = UIImageView()
        selfImageView.frame = CGRect(x: 20, y: textView.frame.maxY, width: 100, height: 100)
        selfImageView.layer.borderColor = UIColor.gray.cgColor
        selfImageView.layer.borderWidth = 2
        selfImageView.image = UIImage(named: "Pokemon.jpg")
        selfImageView.layer.cornerRadius = 100 * 0.5
        selfImageView.layer.masksToBounds = true
        selfImageView.clipsToBounds = true
        View.addSubview(selfImageView)
        
        let HeartLabel = UILabel()
        HeartLabel.frame = CGRect(x: selfImageView.frame.maxX + 15, y: selfImageView.frame.maxY-60, width: 30, height: 30)
        HeartLabel.attributedText = setFontAttribute(Message:"🖤" , Size: 25)
        HeartLabel.textColor = UIColor.black
        View.addSubview(HeartLabel)
        
        let AdavterImageView = UIImageView()
        AdavterImageView.frame = CGRect(x:HeartLabel.frame.maxX + 10, y: textView.frame.maxY, width: 100, height: 100)
        AdavterImageView.layer.borderColor = UIColor.gray.cgColor
        AdavterImageView.layer.borderWidth = 2
        AdavterImageView.image = adavterImage
        AdavterImageView.layer.cornerRadius = 100 * 0.5
        AdavterImageView.layer.masksToBounds = true
        AdavterImageView.clipsToBounds = true
        View.addSubview(AdavterImageView)
        
        let MessageButton = UIButton()
        MessageButton.frame = CGRect(x: selfImageView.frame.minX, y: selfImageView.frame.maxY+30, width: 250, height: 50)
        MessageButton.setAttributedTitle(setFontAttribute(Message:"✉️メッセージを送る" , Size: 15), for: .normal)
        MessageButton.isUserInteractionEnabled = true
        MessageButton.addTarget(self, action: #selector(go_MessageView(_:)), for: .touchUpInside)
        MessageButton.backgroundColor = UIColor(hex: "66cdaa")
        View.addSubview(MessageButton)
        
        let CheckButton = UIButton()
        CheckButton.frame = CGRect(x: MessageButton.frame.minX+40, y: MessageButton.frame.maxY+10, width: 20, height: 20)
        CheckButton.setImage(UIImage(named: "nocheckbutton.png"), for: .normal)
        CheckButton.addTarget(self, action: #selector(check_button(_:)), for: .touchUpInside)
        CheckButton.tag = 0
        View.addSubview(CheckButton)
        
        let CheckButton_Label = UILabel()
        CheckButton_Label.frame = CGRect(x: CheckButton.frame.maxX+5, y: CheckButton.frame.minY, width: 180, height: 20)
        CheckButton_Label.attributedText = setFontAttribute(Message:"以降この画面を表示しない" , Size: 12)
        CheckButton_Label.textColor = UIColor.gray
        View.addSubview(CheckButton_Label)
        
        let CloseButton =  UIButton()
        CloseButton.frame = CGRect(x: View.frame.maxX/2, y:View.frame.maxY+30, width: 30, height: 30)
        CloseButton.setAttributedTitle(setFontAttribute(Message:"×", Size: 20), for: .normal)
        CloseButton.setTitleColor(UIColor.black, for: .normal)
        CloseButton.addTarget(self, action: #selector(close_button(_:)), for: .touchUpInside)
        
        self.view.addSubview(CloseButton)
        self.view.addSubview(View)
    }
    
    @objc func close_button(_ sender:UIButton){
        UserDefaults.standard.set(ViewisHidden,forKey: "MatchingViewisHidden")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func check_button(_ sender:UIButton){
        if sender.tag == 0{
            sender.tag = 1
            sender.setImage(UIImage(named: "checkbutton.png"), for: .normal)
            ViewisHidden = true
        }else{
            sender.tag = 0
            sender.setImage(UIImage(named: "nocheckbutton.png"), for: .normal)
            ViewisHidden = false
        }
    }
    @objc func go_MessageView(_ sender:UIButton){
        //MessageViewController() から戻るとき隠す実装
        //        let VC = MessageViewController()
        //        VC.senderId = self.adavterName
        //        VC.senderDisplayName = "A"
        //        VC.advaterName = "Dummy"
        //        MessageViewController().viewWillAppear(true)
        //        self.view.alpha = 0
        print("TAP___Matching")
    }
    
}
extension MatchingViewController{
    // setFontStyle
    func setFontAttribute(Message:String,FontStyleName:String="HiraKakuProN-W6",Size:Float) -> NSAttributedString{
        let Attribute : NSAttributedString = NSAttributedString(
            string: Message,
            attributes:  [kCTFontAttributeName as NSAttributedString.Key: UIFont(name: FontStyleName, size: CGFloat(Size))!]
        )
        return Attribute
    }
}
