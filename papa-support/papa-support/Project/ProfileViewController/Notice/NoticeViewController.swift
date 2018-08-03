


import UIKit

class NoticeViewController: UIViewController {

    // var of http communication
    let data_post: [String: AnyObject] = ["username":"test" as AnyObject, "password":"password" as AnyObject, "login": "true" as AnyObject]
    let data_get: String = "password=1234512345"
    
    // vars of tableView
    var tableView: UITableView!
    var viewMatchedOpponent: UIButton!
    var margin_const: CGFloat = CGFloat(DeviceSize.statusBarHeight / 2)
    var cellHeight: CGFloat = CGFloat(DeviceSize.navigationbarHeight+DeviceSize.statusBarHeight)
    var opponentImageView: UIImageView!
    var nameLabel: UILabel!
    var otherInformationLabel: UILabel!
    var commentLabel: UILabel!
    var sendMessageButton: UIButton!
    var flagForSenfMessageButton: Bool = true
    
    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setTableView()
        self.navigationItem.title = "お気に入り"
        // HTTP POST通信
        HTTPCommunication.post(postContent: data_post, url: "http://localhost:8888/matching_datalist.php")
    }
    
    // set function
    func setTableView() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: CGFloat(DeviceSize.navigationbarHeight), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight - DeviceSize.navigationbarHeight)))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }
    
    // event function
    @objc func tappedViewMatchedOpponent(sender: UIButton) {
    }
    @objc func tappedSendMessageButton(sender: UIButton) {
        sender.setTitle("いいね！済み", for: UIControl.State.normal)
        sender.backgroundColor = UIColor(hex: "ff1493")
    }

}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.selectionStyle = .none // ボタンが押された時のアクションを無くす
        
        // viewMatchedOpponent(使用しない)
        self.viewMatchedOpponent = UIButton(frame: CGRect(x: self.margin_const, y: self.cellHeight/4, width: CGFloat(DeviceSize.screenWidth)-self.margin_const*2, height: self.cellHeight/2))
        // opponentImageView
        self.opponentImageView = UIImageView(frame: CGRect(x: self.cellHeight/2, y: self.cellHeight/6, width: self.cellHeight/6*4, height: self.cellHeight/6*4))
        self.opponentImageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
        self.opponentImageView.layer.cornerRadius = self.opponentImageView.frame.width * 0.5
        self.opponentImageView.layer.masksToBounds = true
        cell.addSubview(self.opponentImageView)
        // sendMessageButton
        self.sendMessageButton = UIButton(frame: CGRect(x: CGFloat(DeviceSize.screenWidth)-self.margin_const-self.viewMatchedOpponent.bounds.width/4, y: self.cellHeight/4, width: self.viewMatchedOpponent.bounds.width/4, height: self.cellHeight/2))
        self.sendMessageButton.layer.cornerRadius = self.sendMessageButton.frame.width * 0.1
        self.sendMessageButton.layer.masksToBounds = true
        self.sendMessageButton.backgroundColor = UIColor(hex: "ffd700")
        self.sendMessageButton.setTitle("メッセージを送る", for: UIControl.State.normal)
        self.sendMessageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        self.sendMessageButton.addTarget(self, action: #selector(self.tappedSendMessageButton), for: UIControl.Event.touchUpInside)
        cell.addSubview(self.sendMessageButton)
        // Labels
        self.nameLabel = UILabel(frame: CGRect(x: self.opponentImageView.frame.origin.x+self.opponentImageView.frame.width+self.margin_const, y: self.cellHeight/5, width: self.sendMessageButton.bounds.width*0.8, height: self.cellHeight/5))
        self.nameLabel.text = "testちゃん"
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
        cell.addSubview(self.nameLabel)
        //
        self.otherInformationLabel = UILabel(frame: CGRect(x: self.nameLabel.frame.origin.x+self.nameLabel.bounds.width+self.margin_const, y: self.cellHeight/5, width: self.sendMessageButton.bounds.width, height: self.cellHeight/5))
        self.otherInformationLabel.text = "15歳　東京都"
        self.otherInformationLabel.font = UIFont.boldSystemFont(ofSize: 12)
        cell.addSubview(self.otherInformationLabel)
        //
        self.commentLabel = UILabel(frame: CGRect(x: self.opponentImageView.frame.origin.x+self.opponentImageView.frame.width+self.margin_const, y: self.cellHeight/5*3, width: self.viewMatchedOpponent.bounds.width/4*1.8, height: self.cellHeight/5))
        self.commentLabel.text = "お互いがプラスになる関係が理想です"
        self.commentLabel.font = UIFont.boldSystemFont(ofSize: 12)
        cell.addSubview(self.commentLabel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MatchingListPresenter.indexPathRowOfCell = indexPath.row
        let next = MatchingDetailPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
    }
    
}


