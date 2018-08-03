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
    open var image_file_path:String = "0I9A6766ISUMI_TP_V.jpg"
    open var isUserAgeConfirmed = false
    open var advaterName:String!
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
    private let Info_View = UIView()
    private var picker: UIImagePickerController! = UIImagePickerController()
    private var toolbarview:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        set_Toolbar()
        toolbarview = get_under_View()
        self.view.backgroundColor = UIColor.black
    }
    override func viewWillAppear(_ animated: Bool) {
        if(self.navigationController?.navigationBar.topItem?.title != nil){
            self.navigationController!.navigationBar.topItem!.title = ""
            self.navigationController!.navigationBar.backgroundColor = UIColor.darkGray
            self.navigationController?.tabBarController?.tabBar.alpha = 0
            
        }
        set_MessageView_navigationbar_title()
    }
    func set_Toolbar(){
        // add new leftbarButton
        let btn = UIButton()
        btn.setImage(UIImage(named: "plus.png"), for: .normal)
        btn.addTarget(self, action: #selector(Press_Button(_ :)), for: .touchUpInside)
        btn.frame = inputToolbar.contentView.leftBarButtonItem.frame
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width:  CGFloat(DeviceSize.screenWidth), height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.inputToolbar.layer.addSublayer(topBorder)
        self.inputToolbar.contentView.leftBarButtonItem.addSubview(btn)
        self.inputToolbar.contentView.leftBarButtonItem.setImage(UIImage(named: "plus.png"), for: .normal)
        self.inputToolbar.contentView.rightBarButtonItem.setTitle("", for: .normal)
        self.inputToolbar.contentView.rightBarButtonItem.setImage(UIImage(named: "plane.png"), for: .normal)
        self.inputToolbar.contentView.textView.placeHolder = "メッセージ 入力"
        
    }
    func InfoView_Appear(){
        Info_View.frame = CGRect(x: 10, y: 80, width: CGFloat(DeviceSize.screenWidth-20), height: 200)
        Info_View.backgroundColor = UIColor.yellow
        
        let Top_Label = UILabel()
        Top_Label.text = "❕メッセージを送りましょう！"
        Top_Label.font = UIFont.boldSystemFont(ofSize: 20)
        Top_Label.textColor = UIColor.blue
        Top_Label.frame = CGRect(x: Info_View.frame.minX-2, y: Info_View.frame.minY-40, width: 300, height: 20)
        let Text_View =  UITextView()
        Text_View.font = UIFont.systemFont(ofSize: 12)
        Text_View.text = "一通目のメッセージでメールアドレス・LINE ID・カカオ ID・Facebookアカウントやその他SNSのID、携帯電話番号などあなたを特定できる個人情報はお送信できません。"
        Text_View.isEditable = false
        Text_View.backgroundColor = UIColor.clear
        Text_View.textColor = UIColor.brown
        Text_View.frame = CGRect(x: Top_Label.frame.minX, y: Info_View.frame.minY, width: Info_View.frame.width, height: 300)
        let Cancle_btn = UIButton()
        Cancle_btn.setTitle("✖️", for: .normal)
        Cancle_btn.backgroundColor = UIColor.orange
        Cancle_btn.addTarget(self, action: #selector(Press_Info_Button(_:)), for: .touchUpInside)
        Cancle_btn.frame  = CGRect(x: Info_View.frame.maxX-50, y: Info_View.frame.minY-80, width: 30, height: 30)
        
        Info_View.addSubview(Top_Label)
        Info_View.addSubview(Text_View)
        Info_View.addSubview(Cancle_btn)
        self.view.addSubview(Info_View)
    }
    func InfoView_Close(){
        Info_View.isHidden = true
    }
    func setNavigationItem() {
        let imageView = UIImageView(image: UIImage(named: image_file_path))
        let item = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = item
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
    // section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(messages.count == 0){
            InfoView_Appear()
        }
        return messages.count
    }
    //アイテムごとのMessageBubble(背景)を返す
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        if messages[indexPath.row].senderId == "Dummy" {
            return JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImage(
                with: UIColor(red: 112/255, green: 192/255, blue:  75/255, alpha: 1))
        } else {
            return JSQMessagesBubbleImageFactory().incomingMessagesBubbleImage(
                with: UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1))
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        if messages[indexPath.row].senderId == "Dummy" {
            cell.textView?.textColor = UIColor.white
        } else { //相手アイコンタップイベント
            let avatarImageTap = UITapGestureRecognizer( target: self,
                                                         action: #selector(self.tappedAvatar(_:)))
            cell.avatarImageView?.isUserInteractionEnabled = true
            cell.avatarImageView?.layer.cornerRadius = (cell.avatarImageView?.frame.width)! * 0.5
            cell.avatarImageView?.clipsToBounds = true
            cell.avatarImageView?.addGestureRecognizer(avatarImageTap)
            cell.textView?.textColor = UIColor.darkGray
            
        }
        //チャット内の写真タップイベント
        cell.messageBubbleContainerView?.isUserInteractionEnabled = true
        let ImageTap = UITapGestureRecognizer( target: self,
                                               action: #selector(self.tappedImage(_:)))
        cell.messageBubbleContainerView?.tag = indexPath.row
        cell.messageBubbleContainerView?.addGestureRecognizer(ImageTap)
        cell.tag = indexPath.row
        
        return cell
    }
    //ユーザーアイコンのタッチイベント
    @objc func tappedAvatar(_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            print("user icon tapped")
        }
    }
    //チャット内の写真のタッチイベント
    @objc func tappedImage(_ sender: UITapGestureRecognizer){
        print(sender)
        print("Image_tapped")
        var image = UIImage()
        if sender.state == .ended {
            print(sender.view?.tag)
            let message =  self.messages[(sender.view?.tag)!]
            let mediaItem =  message.media
            if mediaItem is JSQPhotoMediaItem{
                let photoItem = mediaItem as! JSQPhotoMediaItem
                image = photoItem.image //UIImage obtained.
            }
            let data = image.jpegData(compressionQuality: 1)
            let base64String = data!.base64EncodedString()
            UserDefaults.standard.set(base64String, forKey: "findphoto")
            let nextVC = ImageViewController()
            nextVC.navigationItem.title = self.messages[(sender.view?.tag)!].senderId
            self.navigationController?.pushViewController(nextVC,animated: true)
        }
    }
    
    // image data for item
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        //senderId == 自分　だった場合表示しない
        let senderId = messages[indexPath.row].senderId
        if senderId == "Dummy" {
            return nil
        }
        return JSQMessagesAvatarImage.avatar(with: UIImage(named: image_file_path))
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
            if message.date.timeIntervalSince(previousMessage.date) / 60 > 1 {
                return kJSQMessagesCollectionViewCellLabelHeightDefault
            }
        }
        return 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Sendボタンが押された時に呼ばれる
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        InfoView_Close()
        
        //キーボードを閉じる
        self.view.endEditing(true)
        if(isUserAgeConfirmed){
            //メッセージを追加
            let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
            self.messages.append(message!)
            //送信を反映
            self.finishReceivingMessage(animated: true)
            //textFieldをクリアする
            self.inputToolbar.contentView.textView.text = ""
            //テスト返信を呼ぶ
            testRecvMessage()
        }else{
            Age_Confirm_Appered()
        }
        
    }
    //plusボタンが押された時に呼ばれる
    @objc func Press_Button(_ sender: UIButton!) {
        print("good_________________________")
        self.view.endEditing(true)
        if(sender.tag == 0){
            cameraView_animate()
            sender.tag = 1
        }else{
            close_cameraView()
            sender.tag = 0
        }
    }
    
    @objc func Press_Info_Button(_ sender: UIButton!) {
        InfoView_Close()
    }
    
    //テスト用「マグロならあるよ！」を返す
    func testRecvMessage() {
        let message = JSQMessage(senderId: "sushi", displayName: "B", text: "マグロならあるよ！")
        self.messages.append(message!)
        
        let photoItem = JSQPhotoMediaItem(image: UIImage(named: image_file_path))
        photoItem?.appliesMediaViewMaskAsOutgoing = false
        let Message = JSQMessage(senderId: "sushi", displayName: "B", media: photoItem)
        
        self.messages.append(Message!)
        self.finishReceivingMessage()
    }
    
}
extension MessageViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func cameraView_animate(){
        UIView.animate(withDuration: 0.2, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -80)
            self.view.subviews[0].transform = transform
            self.view.subviews[1].transform = transform
        })
        UIView.animate(withDuration: 0.1, animations: { () in
            self.toolbarview.transform = self.view.subviews[0].transform
        })
    }
    func close_cameraView(){
        UIView.animate(withDuration: 0.2, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: 0)
            self.view.subviews[0].transform = transform
            self.view.subviews[1].transform = transform
        })
        UIView.animate(withDuration: 0.1, animations: { () in
            self.toolbarview.transform = CGAffineTransform(translationX: 0, y:0)
            
        })
    }
    
    func get_under_View() -> UIView{
        let View = UIView()
        View.backgroundColor = UIColor.brown
        View.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight), width: CGFloat(DeviceSize.screenWidth), height: 120)
        
        let Album_btn = UIButton()
        Album_btn.frame = CGRect(x: 80, y: 0, width: 150, height: 200)
        Album_btn.backgroundColor = UIColor.clear
        Album_btn.addTarget(self, action: #selector(album_event(_ :)), for: .touchUpInside)
        
        let Album_ImageView = UIImageView()
        Album_ImageView.image = UIImage(named: "album.png")
        Album_ImageView.frame = CGRect(x: Album_btn .frame.minX, y: Album_btn .frame.minY+10, width: 50, height: 50)
        
        let Album_btn_text = UITextView()
        Album_btn_text.font = UIFont.systemFont(ofSize: 10)
        Album_btn_text.backgroundColor = UIColor.brown
        Album_btn_text.textColor = UIColor.black
        Album_btn_text.frame = CGRect(x: Album_ImageView.frame.minX-5, y:  Album_ImageView.frame.maxY, width: 120, height: 20)
        Album_btn_text.isEditable = false
        Album_btn_text.text = "カメラロール\nから写真選択"
        
        View.addSubview(Album_ImageView)
        View.addSubview(Album_btn_text)
        View.addSubview(Album_btn)
        
        let Camera_btn = UIButton()
        Camera_btn.frame = CGRect(x: View.frame.width-130, y: 0, width: 150, height: 200)
        Camera_btn.backgroundColor = UIColor.clear
        Camera_btn.addTarget(self, action: #selector(camera_event(_ :)), for: .touchUpInside)
        let Camera_ImageView = UIImageView()
        Camera_ImageView.image = UIImage(named: "camera.png")
        Camera_ImageView.frame = CGRect(x: Camera_btn.frame.minX, y: Camera_btn.frame.minY+10, width: 50, height: 50)
        let Camera_btn_text = UITextView()
        Camera_btn_text.font = UIFont.systemFont(ofSize: 10)
        Camera_btn_text.backgroundColor = UIColor.brown
        Camera_btn_text.textColor = UIColor.black
        Camera_btn_text.frame = CGRect(x: Camera_ImageView.frame.minX-5, y: Camera_ImageView.frame.maxY, width: 120, height: 30)
        Camera_btn_text.isEditable = false
        Camera_btn_text.text = "写真を撮影する"
        View.addSubview(Camera_ImageView)
        View.addSubview(Camera_btn_text)
        View.addSubview(Camera_btn)
        
        let midBorder = CALayer()
        midBorder.frame = CGRect(x: View.frame.width/2, y: 10, width:  1.0, height: 50)
        midBorder.backgroundColor = UIColor.lightGray.cgColor
        View.layer.addSublayer(midBorder)
        
        self.view.addSubview(View)
        self.view.bringSubviewToFront(self.view.subviews[2])
        return View
    }
    
    @objc func camera_event(_ sender:UIButton){
        print("camera")
        //        let nextVC = CameraViewController()
        //        self.present(nextVC, animated: true, completion: nil)
    }
    @objc func album_event(_ sender:UIButton){
        print("photo")
        //PhotoLibraryから画像を選択
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        //現れるピッカーNavigationBarの文字色を設定する
        picker.navigationBar.tintColor = UIColor.white
        picker.delegate = self
        //現れるピッカーNavigationBarの背景色を設定する
        picker.navigationBar.barTintColor = UIColor.gray
        present(picker, animated: true, completion: nil)
    }
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage]as? UIImage {
            
            let photoItem = JSQPhotoMediaItem(image: pickedImage)
            let Message = JSQMessage(senderId: senderId, displayName: senderDisplayName, media: photoItem)
            
            self.messages.append(Message!)
            testRecvMessage()
            //送信を反映
            self.finishReceivingMessage(animated: true)
        }
        InfoView_Close()
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // モーダルビューを閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
extension MessageViewController{
    func set_MessageView_navigationbar_title(){
        let ImageView = UIImageView()
        ImageView.frame = CGRect(x:  0, y: 0, width: 30, height: 30)
        ImageView.image = UIImage(named: "0I9A6766ISUMI_TP_V.jpg")
        ImageView.layer.cornerRadius = 30 * 0.5
        ImageView.clipsToBounds = true
        ImageView.isUserInteractionEnabled = true
        ImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(self.Test1(_:)))
        )
        
        let View = UIView()
        View.frame = CGRect(x: 0, y: 0, width: 40, height:30)
        View.addSubview(ImageView)
        let ImagebarButton = UIBarButtonItem(customView:View)
        
        let Option_button = UIBarButtonItem(title: "｡｡｡", style:UIBarButtonItem.Style.plain, target: self, action: #selector(Option_Tap(_:)))
        
        let BarItems:[UIBarButtonItem] = [Option_button,ImagebarButton]
        
        let Title_Label = UILabel()
        Title_Label.frame = CGRect(x: 200, y: 0, width: 30, height: 20)
        Title_Label.text = advaterName
        self.navigationItem.titleView = Title_Label
        self.navigationItem.setRightBarButtonItems(BarItems, animated: true)
    }
    @objc func Option_Tap(_ sender:UIButton){
        InfoView_apper()
    }
    @objc func Test1(_ sender:UIButton){
        print("usericontapeed!!!!!!")
    }
    func InfoView_apper(){
        
        let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        // 自分の選択肢を生成
        let action1 = UIAlertAction(title: "お気に入りに追加する", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            print("TAP!")
        })
        let action2 = UIAlertAction(title:"違反報告する", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            print("TAP!")
        })
        let action3 = UIAlertAction(title:"ブロックする", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            self.LockView_apper()
        })
        let action4 = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {
            (action: UIAlertAction!) in
            print("TAP!")
        })
        
        // アクションを追加.
        alertSheet.addAction(action1)
        alertSheet.addAction(action2)
        alertSheet.addAction(action3)
        alertSheet.addAction(action4)
        
        alertSheet.popoverPresentationController?.sourceView = self.view
        
        alertSheet.popoverPresentationController?.sourceRect = CGRect(x: DeviceSize.screenWidth, y: DeviceSize.screenHeight, width: 0, height: 0)
        
        present(alertSheet, animated: true, completion: nil)
    }
    func LockView_apper(){
        let alert = UIAlertController(title: nil, message: "ブロックします。\nよろしいですか？", preferredStyle: UIAlertController.Style.alert)
        
        let action1 = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            print("ブロックキャンセル")
        })
        let action2 = UIAlertAction(title:"ブロック", style: UIAlertAction.Style.destructive, handler: {
            (action: UIAlertAction!) in
            print("ブロックしました")
        })
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true, completion: nil)
        
    }
    func Age_Confirm_Appered(){
        let next = AgeConfirmViewController()
        next.modalPresentationStyle = .overCurrentContext
        self.present(next, animated: true, completion: {
        })
        
    }
}
