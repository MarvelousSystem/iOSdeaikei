


import UIKit

class SettingsViewController: UIViewController {

    // vars
    var tableView: UITableView!
    var sectionArray: [[[Any]]] = [
        [["アカウント設定"], [10],
            ["登録情報変更", "通知設定", "足あと設定", "ブロックリスト", "メッセージ非表示リスト", "電話番号をブロック", "プライベートモード設定", "パスコードを設定", "サブ写真表示設定", "メッセージテンプレート設定"]
        ],
        [["サポート"], [4],
            ["ポイントの履歴", "よくある質問", "安心してご利用いただくために", "お問い合わせ"]
        ],
        [["このアプリについて"], [1],
            ["アプリを評価する"]
        ],
        [["その他"], [6],
            ["運用会社", "利用規約", "プライバシーポリシー", "特定商取引に基づく表示", "賃金決済法に基づく表示", "ログアウトする"]
        ]
    ]
    
    // lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        self.navigationItem.title = "設定"
    }
    
    // set function
    func setTableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: CGFloat(DeviceSize.navigationbarHeight), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight - DeviceSize.navigationbarHeight)))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }

}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // sectionの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArray.count
    }
    
    // sectionの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    // sectionのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionArray[section][0][0] as? String
    }
    
    // tableViewのセルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.sectionArray[section][1][0] as? Int)!
    }
    
    // 各セルの要素を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.sectionArray[indexPath.section][2][indexPath.row] as? String
        // ボタンが押された時のアクションを無くす
        cell.selectionStyle = .none
        return cell
    }
    
}
