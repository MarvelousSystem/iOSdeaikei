//  Created by Miyamoto on 2018/05/21.
//  Copyright © 2018年 MiyamotoSota. All rights reserved.
//

import UIKit

// MARK: vars and lifecycle
class MessageListViewController: UIViewController {
    //マッチングの詳細（テスト用）
    open var matchingNumber = 10 // <- マッチングした数
    open var name = "テスト" // <- マッチングした人の名前
    open var user_name = "Dummy" // <- ユーザーの名前
    open var age = 22
    open var livingPlace = "東京都"
    open var ismatching = [true,false,false,true,true,false,true,true,true,true]
    private let TableView: UITableView! = UITableView()
    private let Title: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    override func viewWillAppear(_ animated: Bool) {
        SetTitle()
        SetTableView()
        navigationController?.navigationBar.topItem!.title = "メッセージ"
        let btn = UIBarButtonItem(image: UIImage(named:"icon_reload.png"), style:UIBarButtonItem.Style.done, target: self, action: #selector(Reload_Tablecell(_ :)))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = btn
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController!.navigationBar.backgroundColor = UIColor.white
        navigationController?.tabBarController?.tabBar.alpha = 1
    }
    
    @objc func Reload_Tablecell(_ sender:UIButton){
        self.TableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //        navigationController?.navigationBar.topItem!.title = " "
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func SetTitle(){
        let View = UIView()
        View.frame = CGRect(x: 0, y: CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight), width: CGFloat(DeviceSize.screenWidth), height: 50 )
        
        Title.frame = CGRect(x: 0, y:0, width: CGFloat(DeviceSize.screenWidth), height: 50 )
        Title.font = UIFont.systemFont(ofSize: 17)
        Title.text = "\(matchingNumber)人のお相手をマッチングしています。"
        Title.textColor = UIColor.gray
        self.Title.textAlignment = NSTextAlignment.center
        View.addSubview(Title)
        
        let underBorder = CALayer()
        underBorder.frame = CGRect(x: 0, y: 45, width:  CGFloat(DeviceSize.screenWidth), height: 1.0)
        underBorder.backgroundColor = UIColor.lightGray.cgColor
        View.layer.addSublayer(underBorder)
        
        self.view.addSubview(View)
    }
    
}

// MARK: UITableView and UITableView DataSource and UITableView Delegate
extension MessageListViewController: UITableViewDelegate, UITableViewDataSource {
    // TableView
    func SetTableView() {
        TableView.frame = CGRect(x: 0, y: CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight)+50, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight - DeviceSize.tabBarHeight - DeviceSize.tabBarHeight) )
        TableView.delegate   =   self
        TableView.dataSource =   self
        TableView.register(MessageListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MessageListTableViewCell.self))
        self.view.addSubview(TableView)
    }
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchingNumber
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MessageListTableViewCell.self)) as! MessageListTableViewCell
        cell.faceImage = ErrorSet.errorImage001
        cell.faceImageView.image = cell.faceImage
        cell.detail.text = String(self.name) + " " + String(self.age) + "歳 " + self.livingPlace
        if(ismatching[indexPath.row]){
            cell.matchingDate.textColor = UIColor.red
            cell.matchingDate.text = "マッチングが成立しました！"
            cell.backgroundColor = UIColor(hex: "e0ffff")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(DeviceSize.MessageListViewCellHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        go_MessageView()
    }
}
// Make MessageView navigationbar UI
extension MessageListViewController {
    
    func go_MessageView(){
        let VC = MessageViewController()
        VC.senderId = user_name
        VC.senderDisplayName = "A"
        VC.advaterName = name
        self.navigationController?.pushViewController(VC,animated: true)
    }
    
    
    
}
