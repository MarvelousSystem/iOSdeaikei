// 参考: https://qiita.com/ShinokiRyosei/items/06fb30983236d6342b28


import UIKit

// MARK: vars and lifecycle
class MatchingDatailDMViewController: UIViewController {
    // vars
    var outsideView: UIView!
    var textView: UITextView!
    let SCREEN_SIZE = UIScreen.main.bounds.size
    var isOpen = false // キーボードが表示されているかの判定
    var height: CGFloat! // キーボードの高さ
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutsideView()
        setMessageView()
        setIconImageView()
        setReturnButton()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    // viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureObserver()
    }
    // viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver() // Notificationを画面が消えるときに削除
    }
}

// MARK: -UI
extension MatchingDatailDMViewController {
    // outsideView
    func setOutsideView() {
        outsideView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight)))
        // event
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(tappedOutsideView))
        outsideView.addGestureRecognizer(tapGesture)
        self.view.addSubview(outsideView)
    }
    @objc func tappedOutsideView() {
        self.dismiss(animated: true, completion: nil)
    }
    // messageView
    func setMessageView() {
        let messageView = UIView(frame: CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 16 * 7), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight / 16 * 9)))
        messageView.backgroundColor = UIColor.white
        self.view.addSubview(messageView)
        // Label
        let label = UILabel(frame: CGRect(x: 0, y: messageView.bounds.height / 16, width: CGFloat(DeviceSize.screenWidth), height: messageView.bounds.height / 16))
        label.text = "メッセージを送りましょう！"
        label.tintColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        messageView.addSubview(label)
        // textView
        textView = UITextView(frame: CGRect(x: messageView.bounds.height / 16, y: messageView.bounds.height / 8, width: messageView.bounds.height / 16 * 14, height: messageView.bounds.height / 2))
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.black.cgColor
        textView.text = "お相手しての共通点や気になったことを伝えてみましょう！（メッセージ付いいね！ではポイントが消費されます。また他SNSなどあなたを特定できる個人情報は送信できません）"
        textView.textColor = UIColor.lightGray
        textView.font = UIFont.systemFont(ofSize: 14) //フォントサイズの指定
        textView.delegate = self
        messageView.addSubview(textView)
        // button
        let likeButton = UIButton(frame: CGRect(x: 0, y: messageView.bounds.height / 8 * 6, width: messageView.bounds.width, height: messageView.bounds.height / 8))
        likeButton.backgroundColor = UIColor(hex: "7fffd4")
        likeButton.setTitle("3pt使ってメッセージ付いいね！する", for: UIControl.State.normal)
        likeButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        likeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        likeButton.addTarget(self, action: #selector(self.likeButtonTapped), for: UIControl.Event.touchUpInside)
        messageView.addSubview(likeButton)
        // button
        let cancellButton = UIButton(frame: CGRect(x: 0, y: messageView.bounds.height / 8 * 7, width: messageView.bounds.width, height: messageView.bounds.height / 8))
        cancellButton.backgroundColor = UIColor.white
        cancellButton.setTitle("キャンセル", for: UIControl.State.normal)
        cancellButton.setTitleColor(UIColor.black , for: UIControl.State.normal)
        cancellButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        cancellButton.addTarget(self, action: #selector(self.cancellButtonTapped), for: UIControl.Event.touchUpInside)
        messageView.addSubview(cancellButton)
    }
    @objc func likeButtonTapped() {
    }
    @objc func cancellButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    // iconImageView
    func setIconImageView() {
        let iconImageView: UIImageView = UIImageView(frame: CGRect(x: DeviceSize.screenWidth / 7 * 3, y: DeviceSize.screenHeight / 16 * 7 - DeviceSize.screenWidth / 7 / 2, width: DeviceSize.screenWidth / 7, height: DeviceSize.screenWidth / 7))
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width * 0.5
        iconImageView.clipsToBounds = true
        iconImageView.layer.borderColor = UIColor.white.cgColor
        iconImageView.layer.borderWidth = 3
        iconImageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
        self.view.addSubview(iconImageView)
    }
}

// MARK: -NotificationCenter
extension MatchingDatailDMViewController {
    // Notificationを設定
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // Notificationを削除
    func removeObserver() {
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    // キーボードが現れた時に、画面全体をずらす。
    @objc func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
            self.view.transform = transform
        })
    }
    // キーボードが消えたときに、画面を戻す
    @objc func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            self.view.transform = CGAffineTransform.identity
        })
    }
}

// MARK: -UITextViewDelegate
extension MatchingDatailDMViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("反応")
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "お相手しての共通点や気になったことを伝えてみましょう！（メッセージ付いいね！ではポイントが消費されます。また他SNSなどあなたを特定できる個人情報は送信できません）"
            textView.textColor = UIColor.lightGray
        }
    }
    func textViewShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textView.resignFirstResponder()
        return true
    }
    func setReturnButton() {
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped))
        kbToolBar.items = [spacer, commitButton]
        textView.inputAccessoryView = kbToolBar
    }
    @objc func commitButtonTapped (){
        self.view.endEditing(true)
    }
}
