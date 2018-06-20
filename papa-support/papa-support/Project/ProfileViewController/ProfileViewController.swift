
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
        backgroundImageView.backgroundColor = UIColor.blue
        iconImageView = UIImageView(frame: CGRect(x: DeviceSize.screenWidth / 2 - DeviceSize.screenHeight / 4 / 3 / 2, y: DeviceSize.screenHeight / 4 / 3, width: DeviceSize.screenHeight / 4 / 3, height: DeviceSize.screenHeight / 4 / 3))
        iconImageView.backgroundColor = UIColor.white
        backgroundImageView.addSubview(iconImageView)
        view.addSubview(backgroundImageView)
    }
    // メニューの部分
    func SetButton() {
        // button_1
        let button_1: UIButton = UIButton()
        button_1.backgroundColor = UIColor.white
        button_1.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_1.setTitle("本人確認", for: UIControlState.normal)
        button_1.setTitleColor(UIColor.black , for: UIControlState.normal)
        button_1.addTarget(self, action: #selector(self.tapped), for: .touchUpInside)
        let border_1 = UIView(frame: CGRect(x: 0, y: button_1.frame.size.height - 2.0, width: button_1.frame.size.width, height: 2))
        border_1.backgroundColor = UIColor.red
        button_1.addSubview(border_1)
        self.view.addSubview(button_1)
        // button_2
        let button_2: UIButton = UIButton()
        button_2.backgroundColor = UIColor.white
        button_2.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + DeviceSize.screenHeight / 7 * 4 / 5), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_2.setTitle("ボタンのテキスト2", for: UIControlState.normal)
        button_2.setTitleColor(UIColor.black , for: UIControlState.normal)
        let border_2 = UIView(frame: CGRect(x: 0, y: button_2.frame.size.height - 2.0, width: button_2.frame.size.width, height: 2))
        border_2.backgroundColor = UIColor.red
        button_2.addSubview(border_2)
        self.view.addSubview(button_2)
        // button_3
        let button_3: UIButton = UIButton()
        button_3.backgroundColor = UIColor.white
        button_3.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 2), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_3.setTitle("ボタンのテキスト", for: UIControlState.normal)
        button_3.setTitleColor(UIColor.black , for: UIControlState.normal)
        let border_3 = UIView(frame: CGRect(x: 0, y: button_3.frame.size.height - 2.0, width: button_3.frame.size.width, height: 2))
        border_3.backgroundColor = UIColor.red
        button_3.addSubview(border_3)
        self.view.addSubview(button_3)
        // button_4
        let button_4: UIButton = UIButton()
        button_4.backgroundColor = UIColor.white
        button_4.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 3), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_4.setTitle("ボタンのテキスト", for: UIControlState.normal)
        button_4.setTitleColor(UIColor.black , for: UIControlState.normal)
        let border_4 = UIView(frame: CGRect(x: 0, y: button_4.frame.size.height - 2.0, width: button_4.frame.size.width, height: 2))
        border_4.backgroundColor = UIColor.red
        button_4.addSubview(border_4)
        self.view.addSubview(button_4)
        // button_5
        let button_5: UIButton = UIButton()
        button_5.backgroundColor = UIColor.white
        button_5.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 4 + (DeviceSize.screenHeight / 7 * 4 / 5) * 4), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_5.setTitle("ボタンのテキスト", for: UIControlState.normal)
        button_5.setTitleColor(UIColor.black , for: UIControlState.normal)
        let border_5 = UIView(frame: CGRect(x: 0, y: button_5.frame.size.height - 2.0, width: button_5.frame.size.width, height: 2))
        border_5.backgroundColor = UIColor.red
        button_5.addSubview(border_5)
        self.view.addSubview(button_5)
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
        let nav = UINavigationController(rootViewController: next)
        present(nav, animated: true, completion: nil)
    }
}
    
    
    
    
    /*
    // IconContainerView
    func SetIconContainerView() {
        var iconContainerView: UIView! = UIView()
        // IconContainerViewの調整
        iconContainerView = UIView(frame: CGRect(x: 0, y: DeviceSize.statusBarHeight, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight / 4))
        // IconContainerViewに格納するViewController
        let iconViewController: IconViewController! = IconViewController()
        iconViewController.view.tag = 1
        iconViewController.view.frame = iconContainerView.bounds
        // IconContanerの設定
        iconContainerView.addSubview(iconViewController.view)
        // Add
        view.addSubview(iconContainerView)
    }
    // DetailContainerView
    func SetDetailContainerView() {
        var detailContainerView: UIView! = UIView()
        // DetailContainerViewの生成
        detailContainerView = UIView(frame: CGRect(x: 0, y :DeviceSize.screenHeight / 4, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight / 7 * 4))
        // DetailContainerに格納するViewController
        let detailViewController: DetailViewController! = DetailViewController()
        detailViewController.view.tag = 1
        detailViewController.view.frame = detailContainerView.bounds
        // DetailContainerの設定
        detailContainerView.addSubview(detailViewController.view)
        // Add
        view.addSubview(detailContainerView)
    }
    // AdContainerView
    func SetAdContainerView() {
        var adContainerView: UIView! = UIView()
        // AdContainerViewの調整
        adContainerView = UIView(frame: CGRect(x: 0, y: DeviceSize.screenHeight * (1 / 4 + 1 / 7 * 4), width: DeviceSize.screenWidth, height: DeviceSize.screenHeight - DeviceSize.tabBarHeight - DeviceSize.screenHeight * (1 / 4 + 1 / 7 * 4)))
        // AdContainerViewに格納するViewController
        let adViewController: AdViewController! = AdViewController()
        adViewController.view.tag = 1
        adViewController.view.frame = adContainerView.bounds
        // DetailContainerの設定
        adContainerView.addSubview(adViewController.view)
        // Add
        view.addSubview(adContainerView)
        
    }
    */