


import UIKit

class MatchingDatailDMViewController: UIViewController {
    // vars
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutsideView()
        setMessageView()
        setIconImageView()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    // outsideView
    func setOutsideView() {
        let outsideView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight)))
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
        //textView.placeholder = "お相手しての共通点や気になったことを伝えてみましょう！（メッセージ付いいね！ではポイントが消費されます。また他SNSなどあなたを特定できる個人情報は送信できません）" //プレースホルダの設定
        textView.font = UIFont.systemFont(ofSize: 14) //フォントサイズの指定
        //textField.borderStyle = UITextField.BorderStyleUITextField.BorderStyle.Line //線の枠線
        //textView.borderStyle = UITextField.BorderStyle.bezel //立体的な枠線
        //textView.borderStyle = UITextField.BorderStyle.roundedRect //角丸
        //textView.adjustsFontSizeToFitWidth = true
        //textView.minimumFontSize = 0;
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
}
