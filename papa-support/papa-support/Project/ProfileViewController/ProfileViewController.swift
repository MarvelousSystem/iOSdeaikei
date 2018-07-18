
import UIKit

// vars and lifecycle
class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SetDetailContainerView()
        //SetAdContainerView()
        SetIconImageView()
        SetButton()
        setAd()
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        // NavigationBar を隠す
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        // NavigationBar を戻す
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    // プロフィールの部分
    func SetIconImageView() {
        var backgroundImageView: UIImageView!
        var iconImageView: UIImageView!
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight / 4 + DeviceSize.statusBarHeight))
        backgroundImageView.backgroundColor = UIColor(patternImage: UIImage(named: "DSC01831-680x451.jpg")!)
        iconImageView = UIImageView(frame: CGRect(x: DeviceSize.screenWidth / 2 - DeviceSize.screenHeight / 4 / 2.5 / 2, y: DeviceSize.screenHeight / 4 / 2 - DeviceSize.screenHeight / 4 / 2.5 / 2, width: DeviceSize.screenHeight / 4 / 2.5, height: DeviceSize.screenHeight / 4 / 2.5))
        iconImageView.backgroundColor = UIColor.white
        // icon
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width * 0.5
        iconImageView.clipsToBounds = true
        iconImageView.layer.borderColor = UIColor.white.cgColor
        iconImageView.layer.borderWidth = 3
        // iconImage
        iconImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedIconImageView))
        iconImageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
        backgroundImageView.addSubview(iconImageView)
        view.addGestureRecognizer(tapGesture)
        view.addSubview(backgroundImageView)
        // nameLabel
        let nameLabel = UILabel(frame: CGRect(x: CGFloat(DeviceSize.screenWidth / 4), y: iconImageView.bounds.height * 1.75, width: CGFloat(DeviceSize.screenWidth / 2), height: iconImageView.bounds.height / 2))
        nameLabel.text = "テスト"
        nameLabel.tintColor = UIColor.black
        nameLabel.textAlignment = NSTextAlignment.center
        backgroundImageView.addSubview(nameLabel)
    }
    @objc func tappedIconImageView() {
        print("あああ")
        let next = EditProfileViewController()
        self.navigationController?.pushViewController(next, animated: true)
    }
    // メニューの部分
    func SetButton() {
        // button_1
        let button_1: UIButton = UIButton()
        button_1.backgroundColor = UIColor.white
        button_1.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_1.setTitle("本人確認", for: UIControl.State.normal)
        button_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_1.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        let border_1 = UIView(frame: CGRect(x: 0, y: button_1.frame.size.height - 0.5, width: button_1.frame.size.width, height: 0.5))
        border_1.backgroundColor = UIColor.darkGray
        button_1.addSubview(border_1)
        self.view.addSubview(button_1)
        // button_2_1
        let button_2_1: UIButton = UIButton()
        button_2_1.backgroundColor = UIColor.white
        button_2_1.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + DeviceSize.screenHeight / 7 * 4 / 5), width: self.view.bounds.width/2, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_2_1.setTitle("残ポイント", for: UIControl.State.normal)
        button_2_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_2_1 = UIView(frame: CGRect(x: 0, y: button_2_1.frame.size.height - 0.5, width: button_2_1.frame.size.width, height: 0.5))
        border_2_1.backgroundColor = UIColor.darkGray
        button_2_1.addSubview(border_2_1)
        let border_2_1_2 = UIView(frame: CGRect(x: button_2_1.frame.width - 0.25, y: button_2_1.frame.height/4, width: 0.25, height: button_2_1.frame.height/2))
        border_2_1_2.backgroundColor = UIColor.darkGray
        button_2_1.addSubview(border_2_1_2)
        self.view.addSubview(button_2_1)
        // button_2_2
        let button_2_2: UIButton = UIButton()
        button_2_2.backgroundColor = UIColor.white
        button_2_2.frame = CGRect(x: self.view.bounds.width/2, y: CGFloat(DeviceSize.screenHeight / 4 + DeviceSize.screenHeight / 7 * 4 / 5), width: self.view.bounds.width/2, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_2_2.setTitle("残いいね", for: UIControl.State.normal)
        button_2_2.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_2_2_1 = UIView(frame: CGRect(x: 0, y: button_2_2.frame.size.height - 0.5, width: button_2_2.frame.size.width, height: 0.5))
        border_2_2_1.backgroundColor = UIColor.darkGray
        button_2_2.addSubview(border_2_2_1)
        let border_2_2_2 = UIView(frame: CGRect(x: 0, y: button_2_2.frame.height/4, width: 0.25, height: button_2_1.frame.height/2))
        button_2_2.addSubview(border_2_2_2)
        border_2_2_2.backgroundColor = UIColor.darkGray
        self.view.addSubview(button_2_2)
        // button_3_1
        let button_3_1: UIButton = UIButton()
        button_3_1.backgroundColor = UIColor.white
        button_3_1.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 2), width: self.view.bounds.width / 3, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_3_1.setTitle("あしあと", for: UIControl.State.normal)
        button_3_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_3_1.addTarget(self, action: #selector(self.tappedButton_3_1), for: UIControl.Event.touchUpInside)
        let border_3_1 = UIView(frame: CGRect(x: 0, y: button_3_1.frame.size.height - 0.5, width: button_3_1.frame.size.width, height: 0.5))
        border_3_1.backgroundColor = UIColor.darkGray
        button_3_1.addSubview(border_3_1)
        let border_3_1_2 = UIView(frame: CGRect(x: CGFloat(DeviceSize.screenWidth/3) - 0.25, y: button_3_1.frame.height/4, width: 0.25, height: button_3_1.frame.height/2))
        border_3_1_2.backgroundColor = UIColor.darkGray
        button_3_1.addSubview(border_3_1_2)
        self.view.addSubview(button_3_1)
        // button_3_2
        let button_3_2: UIButton = UIButton()
        button_3_2.backgroundColor = UIColor.white
        button_3_2.frame = CGRect(x: self.view.bounds.width / 3, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 2), width: self.view.bounds.width / 3, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_3_2.setTitle("ポイント", for: UIControl.State.normal)
        button_3_2.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_3_2.addTarget(self, action: #selector(self.tappedButton_3_2), for: UIControl.Event.touchUpInside)
        let border_3_2 = UIView(frame: CGRect(x: 0, y: button_3_2.frame.size.height - 0.5, width: button_3_2.frame.size.width, height: 0.5))
        border_3_2.backgroundColor = UIColor.darkGray
        button_3_2.addSubview(border_3_2)
        let border_3_2_2 = UIView(frame: CGRect(x: 0, y: button_3_2.frame.height/4, width: 0.25, height: button_3_2.frame.height/2))
        border_3_2_2.backgroundColor = UIColor.darkGray
        button_3_2.addSubview(border_3_2_2)
        let border_3_2_3 = UIView(frame: CGRect(x: CGFloat(DeviceSize.screenWidth/3 * 2) - 0.25, y: button_3_2.frame.height/4, width: 0.25, height: button_3_2.frame.height/2))
        border_3_2_3.backgroundColor = UIColor.darkGray
        button_3_2.addSubview(border_3_2_3)
        self.view.addSubview(button_3_2)
        // button_3_3
        let button_3_3: UIButton = UIButton()
        button_3_3.backgroundColor = UIColor.white
        button_3_3.frame = CGRect(x: self.view.bounds.width / 3 * 2, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 2), width: self.view.bounds.width / 3, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_3_3.setTitle("お知らせ", for: UIControl.State.normal)
        button_3_3.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_3_3.addTarget(self, action: #selector(self.tappedButton_3_3), for: UIControl.Event.touchUpInside)
        let border_3_3 = UIView(frame: CGRect(x: 0, y: button_3_3.frame.size.height - 0.5, width: button_3_3.frame.size.width, height: 0.5))
        border_3_3.backgroundColor = UIColor.darkGray
        button_3_3.addSubview(border_3_3)
        let border_3_3_2 = UIView(frame: CGRect(x: 0, y: button_3_3.frame.height/4, width: 0.25, height: button_3_3.frame.height/2))
        border_3_3_2.backgroundColor = UIColor.darkGray
        button_3_3.addSubview(border_3_3_2)
        self.view.addSubview(button_3_3)
        // button_4_1
        let button_4_1: UIButton = UIButton()
        button_4_1.backgroundColor = UIColor.white
        button_4_1.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 3), width: self.view.bounds.width/2, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_4_1.addTarget(self, action: #selector(self.tappedButton_4_1), for: UIControl.Event.touchUpInside)
        button_4_1.setTitle("あなたから", for: UIControl.State.normal)
        button_4_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_4_1 = UIView(frame: CGRect(x: 0, y: button_4_1.frame.size.height - 0.5, width: button_4_1.frame.size.width, height: 0.5))
        border_4_1.backgroundColor = UIColor.darkGray
        button_4_1.addSubview(border_4_1)
        let border_4_1_2 = UIView(frame: CGRect(x: CGFloat(DeviceSize.screenWidth/2) - 0.25, y: 0, width: 0.25, height: button_4_1.frame.height))
        border_4_1_2.backgroundColor = UIColor.darkGray
        button_4_1.addSubview(border_4_1_2)
        self.view.addSubview(button_4_1)
        // button_4_2
        let button_4_2: UIButton = UIButton()
        button_4_2.backgroundColor = UIColor.white
        button_4_2.frame = CGRect(x: self.view.bounds.width/2, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 3), width: self.view.bounds.width/2, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_4_2.addTarget(self, action: #selector(self.tappedButton_4_2), for: UIControl.Event.touchUpInside)
        button_4_2.setTitle("お気に入り", for: UIControl.State.normal)
        button_4_2.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_4_2 = UIView(frame: CGRect(x: 0, y: button_4_2.frame.size.height - 0.5, width: button_4_2.frame.size.width, height: 0.5))
        border_4_2.backgroundColor = UIColor.darkGray
        button_4_2.addSubview(border_4_2)
        let border_4_2_2 = UIView(frame: CGRect(x: CGFloat(DeviceSize.screenWidth/2) - 0.25, y: 0, width: 0.25, height: button_4_2.frame.height))
        border_4_2_2.backgroundColor = UIColor.darkGray
        button_4_2.addSubview(border_4_2_2)
        self.view.addSubview(button_4_2)
        // button_5_1
        let button_5_1: UIButton = UIButton()
        button_5_1.backgroundColor = UIColor.white
        button_5_1.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 4), width: self.view.bounds.width/2, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_5_1.addTarget(self, action: #selector(self.tappedButton_5_1), for: UIControl.Event.touchUpInside)
        button_5_1.setTitle("設定", for: UIControl.State.normal)
        button_5_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_5_1 = UIView(frame: CGRect(x: 0, y: button_5_1.frame.size.height - 0.5, width: button_5_1.frame.size.width, height: 0.5))
        border_5_1.backgroundColor = UIColor.darkGray
        button_5_1.addSubview(border_5_1)
        let border_5_1_2 = UIView(frame: CGRect(x: CGFloat(DeviceSize.screenWidth/2) - 0.25, y: 0, width: 0.25, height: button_5_1.frame.height))
        border_5_1_2.backgroundColor = UIColor.darkGray
        button_5_1.addSubview(border_5_1_2)
        self.view.addSubview(button_5_1)
        // button_5_2
        let button_5_2: UIButton = UIButton()
        button_5_2.backgroundColor = UIColor.white
        button_5_2.frame = CGRect(x: self.view.bounds.width/2, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 4), width: self.view.bounds.width/2, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_5_2.addTarget(self, action: #selector(self.tappedButton_5_2), for: UIControl.Event.touchUpInside)
        button_5_2.setTitle("ヘルプ", for: UIControl.State.normal)
        button_5_2.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_5_2 = UIView(frame: CGRect(x: 0, y: button_5_2.frame.size.height - 0.5, width: button_5_2.frame.size.width, height: 0.5))
        border_5_2.backgroundColor = UIColor.darkGray
        button_5_2.addSubview(border_5_2)
        let border_5_2_2 = UIView(frame: CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: 0, width: 0.25, height: button_5_2.frame.height))
        border_5_2_2.backgroundColor = UIColor.darkGray
        button_5_1.addSubview(border_5_2_2)
        self.view.addSubview(button_5_2)
    }
    // 広告の部分
    func setAd() {
        var adTest: UILabel!
        self.view.backgroundColor = UIColor.white
        let height = DeviceSize.screenHeight - DeviceSize.tabBarHeight - DeviceSize.screenHeight * (1 / 4 + 1 / 7 * 4)
        adTest = UILabel(frame: CGRect(x: 0, y: DeviceSize.screenHeight - height - DeviceSize.tabBarHeight , width: DeviceSize.screenWidth, height: height))
        adTest.text = "ここに広告が表示されます"
        self.view.addSubview(adTest)
    }
    // ボタンがたっぷされた時に行う
    @objc func tapped() {
        let next = ConfirmationViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_3_1
    @objc func tappedButton_3_1() {
        let next = FootprintViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_3_2
    @objc func tappedButton_3_2() {
        let next = PointViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_3_3
    @objc func tappedButton_3_3() {
        let next = NoticeViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_4_1
    @objc func tappedButton_4_1() {
        let next = FromYouViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_4_2
    @objc func tappedButton_4_2() {
        let next = NoticeViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_5_1
    @objc func tappedButton_5_1() {
        let next = SettingsViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    // button_5_2
    @objc func tappedButton_5_2() {
        let next = HelpViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
}
