// 参考サイト:https://qiita.com/Kyomesuke3/items/54fe3fddab6d947c1df9


import UIKit
import Foundation

class MatchingAppointmentSoonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setOutsideView()
        setMainView()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    // 画面遷移するときはこのモーダルダイアログを消す
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.dismiss(animated: true, completion: nil)
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
    // tapped
    @objc func tappedOutsideView() {
        print("test")
        self.dismiss(animated: true, completion: nil)
    }
    // mainView
    func setMainView() {
        let mainView = UIView(frame : CGRect(x: DeviceSize.screenWidth / 7, y: DeviceSize.screenHeight / 4, width: DeviceSize.screenWidth / 7 * 5, height: DeviceSize.screenHeight / 4 * 2))
        mainView.backgroundColor = UIColor.white
        let button = UIButton(frame: CGRect(x: mainView.bounds.width / 16, y: mainView.bounds.height / 7 * 4, width: mainView.bounds.width / 20 * 18, height: mainView.bounds.height / 7))
        button.backgroundColor = UIColor(hex: "7fffd4")
        button.setTitle("同じく今日会えるお相手を探す", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white , for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 3
        // add
        mainView.addSubview(button)
        self.view.addSubview(mainView)
    }
}
