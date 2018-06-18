//  Created by Miyamoto on 2018/05/21.
//  Copyright © 2018年 MiyamotoSota. All rights reserved.
//

import UIKit

// MARK: vars and lifecycle
class MessageListViewController: UIViewController {
    
    //マッチングの詳細（テスト用）
    var matchingNumber = 10 // <- マッチングした数
    var name = "テスト" // <- マッチングした人の名前
    var age = 22
    var livingPlace = "東京都"
    
    var tableView: UITableView! = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetTableView()
        self.view.backgroundColor = UIColor.white
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = "メッセージ"
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = " "
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // TableView
    func SetTableView() {
        tableView.frame = CGRect(x: 0, y: CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight - DeviceSize.tabBarHeight - DeviceSize.tabBarHeight) )
        self.tableView.delegate   =   self
        self.tableView.dataSource =   self
        self.tableView.register(MessageListTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MessageListTableViewCell.self))
        self.view.addSubview(tableView)
    }
}

// MARK: UITableView DataSource and UITableView Delegate
extension MessageListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchingNumber
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = String(matchingNumber) + "人のお相手をマッチングしています"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MessageListTableViewCell.self)) as! MessageListTableViewCell
            cell.faceImage = ErrorSet.errorImage001
            cell.faceImageView.image = cell.faceImage
            cell.detail.text = String(self.name) + " " + String(self.age) + "歳 " + self.livingPlace
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return CGFloat(DeviceSize.MessageListViewCellHeight / 3 * 2)
        } else {
            return CGFloat(DeviceSize.MessageListViewCellHeight)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
