//
//  MessageViewController.swift
//  papa-support
//
//  Created by Ricky on 2018/06/25.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController
// JSQMessages Frameworksに関する  http://developers.goalist.co.jp/entry/2017/05/31/190911
class MessageViewController: JSQMessagesViewController {
    var messages: [JSQMessage] = [
        JSQMessage(senderId: "sushi", displayName: "B", text: "らっしゃい♪"),
        JSQMessage(senderId: "Dummy",  displayName: "A", text: "大将！つぶ貝!"),
        JSQMessage(senderId: "sushi", displayName: "B", text: "ないよ！"),
        JSQMessage(senderId: "Dummy",  displayName: "A", text: "じゃサーモン!"),
        JSQMessage(senderId: "sushi", displayName: "B", text: "ないよ♪"),
        JSQMessage(senderId: "Dummy",  displayName: "A", text: "いか!"),
        JSQMessage(senderId: "sushi", displayName: "B", text: "ないよ♪"),
        JSQMessage(senderId: "Dummy",  displayName: "A", text: "じゃ帰る！"),
        JSQMessage(senderId: "sushi", displayName: "B", text: "ちょwww待てってwww\nマグロあるからwww")
    ]
    //    var Image:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn  = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        
        self.inputToolbar.contentView.leftBarButtonItem.setTitle("+", for: .normal)
        self.inputToolbar.contentView.rightBarButtonItem.setTitle("送信", for: .normal)
        
        
        senderDisplayName = "A"
        senderId = "Dummy"
        
        
        
        //        self.view.frame = CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height-60)
        //        self.view.backgroundColor = UIColor.white
        //        SetCotntesbar()
        
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
    //アイテムごとのMessageBubble(背景)を返す
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        if messages[indexPath.row].senderId == senderId {
            return JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImage(
                with: UIColor(red: 112/255, green: 192/255, blue:  75/255, alpha: 1))
        } else {
            return JSQMessagesBubbleImageFactory().incomingMessagesBubbleImage(
                with: UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1))
        }
    }
    
    
    // cell for item
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        
        if messages[indexPath.row].senderId == senderId {
            cell.textView?.textColor = UIColor.white
        } else {
            cell.textView?.textColor = UIColor.darkGray
        }
        return cell
    }
    
    
    // section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    // image data for item
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        //senderId == 自分　だった場合表示しない
        let senderId = messages[indexPath.row].senderId
        
        if senderId == "Dummy" {
            return nil
        }
        return JSQMessagesAvatarImage.avatar(with: UIImage(named: "0I9A6766ISUMI_TP_V.jpg"))
    }
    
    
    //時刻表示のための高さ調整
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        
        let message = messages[indexPath.item]
        if indexPath.item == 0 {
            return JSQMessagesTimestampFormatter.shared().attributedTimestamp(for: message.date)
        }
        if indexPath.item - 1 > 0 {
            let previousMessage = messages[indexPath.item - 1]
            if message.date.timeIntervalSince(previousMessage.date) / 60 > 1 {
                return JSQMessagesTimestampFormatter.shared().attributedTimestamp(for: message.date)
            }
        }
        return nil
    }
    
    
    // 送信時刻を出すために高さを調整する
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellTopLabelAt indexPath: IndexPath!) -> CGFloat {
        
        if indexPath.item == 0 {
            return kJSQMessagesCollectionViewCellLabelHeightDefault
        }
        if indexPath.item - 1 > 0 {
            let previousMessage = messages[indexPath.item - 1]
            let message = messages[indexPath.item]
            if message.date .timeIntervalSince(previousMessage.date) / 60 > 1 {
                return kJSQMessagesCollectionViewCellLabelHeightDefault
            }
        }
        return 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func SetCotntesbar(){
        let tabBar = UIView()
        tabBar.frame = CGRect(x:0,y:self.view.frame.maxY+10,width:self.view.frame.width,height:50)
        tabBar.backgroundColor = UIColor.darkGray
        self.view.addSubview(tabBar)
        
    }
    func Set_Left_button(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Sendボタンが押された時に呼ばれる
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        //キーボードを閉じる
        self.view.endEditing(true)
        
        //メッセージを追加
        let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        self.messages.append(message!)
        
        //送信を反映
        self.finishReceivingMessage(animated: true)
        
        //textFieldをクリアする
        self.inputToolbar.contentView.textView.text = ""
        
        
        //テスト返信を呼ぶ
        testRecvMessage()
    }
    //左側の追加ボタン
    override func didPressAccessoryButton(_ sender: UIButton!) {
        print("patse_________________________")
    }
    
    //テスト用「マグロならあるよ！」を返す
    func testRecvMessage() {
        
        let message = JSQMessage(senderId: "sushi", displayName: "B", text: "マグロならあるよ！")
        self.messages.append(message!)
        self.finishReceivingMessage(animated: true)
    }
}
