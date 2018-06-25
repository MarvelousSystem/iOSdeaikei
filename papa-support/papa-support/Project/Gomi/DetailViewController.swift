


import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SetButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func SetButton() {
        // button_1
        let button_1: UIButton = UIButton()
        button_1.backgroundColor = UIColor.white
        button_1.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_1.setTitle("本人確認", for: UIControl.State.normal)
        button_1.setTitleColor(UIColor.black , for: UIControl.State.normal)
        button_1.addTarget(self, action: #selector(DetailViewController.tapped), for: UIControl.Event.touchUpInside)
        let border_1 = UIView(frame: CGRect(x: 0, y: button_1.frame.size.height - 2.0, width: button_1.frame.size.width, height: 2))
        border_1.backgroundColor = UIColor.red
        button_1.addSubview(border_1)
        self.view.addSubview(button_1)
        // button_2
        let button_2: UIButton = UIButton()
        button_2.backgroundColor = UIColor.white
        button_2.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5), width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_2.setTitle("ボタンのテキスト", for: UIControl.State.normal)
        button_2.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_2 = UIView(frame: CGRect(x: 0, y: button_2.frame.size.height - 2.0, width: button_2.frame.size.width, height: 2))
        border_2.backgroundColor = UIColor.red
        button_2.addSubview(border_2)
        self.view.addSubview(button_2)
        // button_3
        let button_3: UIButton = UIButton()
        button_3.backgroundColor = UIColor.white
        button_3.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5) * 2, width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_3.setTitle("ボタンのテキスト", for: UIControl.State.normal)
        button_3.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_3 = UIView(frame: CGRect(x: 0, y: button_3.frame.size.height - 2.0, width: button_3.frame.size.width, height: 2))
        border_3.backgroundColor = UIColor.red
        button_3.addSubview(border_3)
        self.view.addSubview(button_3)
        // button_4
        let button_4: UIButton = UIButton()
        button_4.backgroundColor = UIColor.white
        button_4.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5) * 3, width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_4.setTitle("ボタンのテキスト", for: UIControl.State.normal)
        button_4.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_4 = UIView(frame: CGRect(x: 0, y: button_4.frame.size.height - 2.0, width: button_4.frame.size.width, height: 2))
        border_4.backgroundColor = UIColor.red
        button_4.addSubview(border_4)
        self.view.addSubview(button_4)
        // button_5
        let button_5: UIButton = UIButton()
        button_5.backgroundColor = UIColor.white
        button_5.frame = CGRect(x: 0, y: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5) * 4, width: self.view.bounds.width, height: CGFloat(DeviceSize.screenHeight / 7 * 4 / 5))
        button_5.setTitle("ボタンのテキスト", for: UIControl.State.normal)
        button_5.setTitleColor(UIColor.black , for: UIControl.State.normal)
        let border_5 = UIView(frame: CGRect(x: 0, y: button_5.frame.size.height - 2.0, width: button_5.frame.size.width, height: 2))
        border_5.backgroundColor = UIColor.red
        button_5.addSubview(border_5)
        self.view.addSubview(button_5)
    }
    @objc func tapped() {
        print("テスト")
    }
    
}
