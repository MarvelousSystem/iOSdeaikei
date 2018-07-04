
import UIKit

class ViolationReportViewController: UIViewController {

    // vars
    var scrollView: ViolationReportScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setSendButton()
        setScrollView()
        self.title = "違反報告"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "違反報告"
    }
    // 違反報告ボタン
    func setSendButton() {
        let const: Double = 8 // <- 間隔を決める定数
        let sendButton: UIButton = UIButton()
        sendButton.backgroundColor = UIColor(hex: "7fffd4")
        sendButton.frame = CGRect(x: const / 2, y: Double(self.view.bounds.height) - DeviceSize.tabBarHeight - const, width: Double(self.view.bounds.width) - const, height: DeviceSize.tabBarHeight)
        sendButton.setTitle("違反を報告", for: UIControl.State.normal)
        sendButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        sendButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        sendButton.layer.cornerRadius = 22
        sendButton.addTarget(self, action: #selector(self.tappedSendButton), for: UIControl.Event.touchUpInside)
        sendButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        self.view.addSubview(sendButton)
    }
    // 押されたとき
    @objc func tappedSendButton() {
    }
    // scrollView
    func setScrollView() {
        scrollView = ViolationReportScrollView()
        scrollView.frame = CGRect(x: 0, y: DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight - DeviceSize.tabBarHeight - DeviceSize.navigationbarHeight - DeviceSize.statusBarHeight * 2)
        // 追加情報
        scrollView.label_3.text = "テスト" + " " + "さん"
        self.view.addSubview(scrollView)
    }
}
