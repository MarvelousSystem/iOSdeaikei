


import UIKit

// MARK: vars and lifecycle
class MatchingDetailViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var otherImageCount: Int = 7 //<- test
    var flagForTappedFunction: Bool = false         //tapped()
    var flagForTappedFunction_2: Bool = false         //tapped()
    
    var buttonView: UIView!
    var likedButton: UIButton!
    var likeButton: UIButton!
    var messageButton: UIButton!
    // extension`s vars
    var introductionContentLabel: UILabel!
    var profileItemlabel: UILabel!
    var basisProfileLabel: UILabel!
    var prifileContentsLabel: UILabel!
    var futureLabel: UILabel!
    var futureContentItemLabel: UILabel!
    var hopeItemLabel: UILabel!
    var hope1Label: UILabel!
    var hope2Label: UILabel!
    var hope1ContentLabel: UILabel!
    var hope2ContentLabel: UILabel!
    var jobItemLabel: UILabel!
    var jobItem1Label: UILabel!
    var jobItemContentLabel: UILabel!
    var privateItemLabel: UILabel!
    var hobbyItemLabel: UILabel!
    var personalityaItemLabel: UILabel!
    var liquorItemLabel: UILabel!
    var tabaccoItemLabel: UILabel!
    var holidayItemLabel: UILabel!
    var hobbyItemContentLabel: UILabel!
    var personalityItemContentLabel: UILabel!
    var liquorItemContentLabel: UILabel!
    var tabaccoItemContentLabel: UILabel!
    var holidayItemContentLabel: UILabel!
    
    // 前画面で選択されたCollectionCellのindexPath.row
    let indexPathRowOfCell = MatchingListPresenter.indexPathRowOfCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonView()
        setTableView()
        print("MatchingDetailViewController:\(indexPathRowOfCell)")
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // tableView
    func setTableView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: CGFloat(DeviceSize.navigationbarHeight), width: self.view.bounds.width, height: self.view.bounds.height - CGFloat(DeviceSize.navigationbarHeight * 2 + DeviceSize.statusBarHeight)))
        tableView.estimatedRowHeight = 40 //基準となるheightを設定
        tableView.estimatedRowHeight = UITableView.automaticDimension //別々のcellが別々のheightを持てるようになる
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    // buttonView
    func setButtonView() {
        buttonView = UIView(frame: CGRect(x: 0, y: self.view.bounds.height - CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight)))
        buttonView.backgroundColor = UIColor.white
        self.view.addSubview(buttonView)
        // 定数
        let const: CGFloat = CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight) / 8
        // button
        likeButton = UIButton(frame: CGRect(x: 0 + const, y: const + self.view.bounds.height - buttonView.bounds.height, width: buttonView.bounds.width / 4 * 3 - const * 1, height: buttonView.bounds.height - const * 2))
        likeButton.backgroundColor = UIColor(hex: "7fffd4")
        likeButton.setTitle("♡いいね！", for: UIControl.State.normal)
        likeButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        likeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        likeButton.layer.cornerRadius = 5
        likeButton.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(likeButton)
        // button
        messageButton = UIButton(frame: CGRect(x: const + buttonView.bounds.width / 4 * 3, y: self.view.bounds.height - buttonView.bounds.height + const, width: buttonView.bounds.width / 4 * 1 - const * 2, height: buttonView.bounds.height - const * 2))
        messageButton.backgroundColor = UIColor(hex: "7fffd4")
        messageButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        messageButton.setTitle("DM", for: UIControl.State.normal)
        messageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        messageButton.layer.cornerRadius = 5
        messageButton.addTarget(self, action: #selector(self.messageButtonTapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(messageButton)
    }
    @objc func tapped() {
        if (self.flagForTappedFunction == false) {     // いいねボタンのとき
            self.flagForTappedFunction = true
            setButtonView()
            if (likedButton != nil) {
                let alertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                //
                let removeAction = UIAlertAction(title: "いいねを取り消す", style: .default, handler: {
                    (action:UIAlertAction!) -> Void in
                })
                // Cancel
                let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: {(action:UIAlertAction!) -> Void in
                })
                // add action
                alertController.addAction(removeAction)
                alertController.addAction(cancelAction)
                
                present(alertController, animated: true, completion: nil)
                
                likedButton.removeFromSuperview()
            }
        } else {                                       // いいねしましたボタンのとき
            self.flagForTappedFunction = false
            // 定数
            let const: CGFloat = CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight) / 8
            // button
            likedButton = UIButton(frame: CGRect(x: 0 + const, y: const + self.view.bounds.height - buttonView.bounds.height, width: buttonView.bounds.width / 4 * 3 - const * 1, height: buttonView.bounds.height - const * 2))
            likedButton.backgroundColor = UIColor.white
            likedButton.setTitleColor(UIColor.black , for: UIControl.State.normal)
            likedButton.setTitle("いいねしました", for: UIControl.State.normal)
            likedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            likedButton.layer.cornerRadius = 5
            likedButton.layer.borderColor = UIColor.black.cgColor
            likedButton.layer.borderWidth = 1.0
            likedButton.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
            self.view.addSubview(likedButton)
            if (buttonView != nil && likeButton != nil && messageButton != nil) {
                buttonView.removeFromSuperview()
                likeButton.removeFromSuperview()
                messageButton.removeFromSuperview()
            }
        }
        
        return
    }
    @objc func messageButtonTapped() {
        let next = MatchingDatailDMViewController()
        next.modalPresentationStyle = .overCurrentContext
        self.present(next, animated: true, completion: {
        })
    }
}

// MARK: -UITableView DataSource and UITableView Delegate
extension MatchingDetailViewController: UITableViewDelegate, UITableViewDataSource {
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let const: Double = DeviceSize.navigationbarHeight / 3 //外枠の長さ
        // image
        if indexPath.row == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none // ボタンが押された時のアクションを無くす
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: DeviceSize.screenWidth, height: DeviceSize.screenWidth))
            imageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
            // shadow
            let shadowView = UILabel(frame: CGRect(x: 0, y: imageView.bounds.height / 7 * 6, width: imageView.bounds.width, height: imageView.bounds.height / 7))
            shadowView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
            let shadowPath = UIBezierPath(rect: shadowView.bounds)
            shadowView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowView.layer.shadowPath = shadowPath.cgPath
            shadowView.layer.shouldRasterize = true
            imageView.addSubview(shadowView)
            // label
            let label = UILabel(frame: CGRect(x: 25, y: imageView.bounds.height / 7 * 6, width: imageView.bounds.width, height: imageView.bounds.height / 7 / 2))
            label.text = "テスト子　テスト歳　テスト県"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = UIColor.white
            imageView.addSubview(label)
            let label_2 = UILabel(frame: CGRect(x: 25, y: imageView.bounds.height / 7 * 6 + imageView.bounds.height / 7 / 2, width: imageView.bounds.width, height: imageView.bounds.height / 7 / 2))
            label_2.text = "アメリカとフランスに住んでました"
            label_2.font = UIFont.boldSystemFont(ofSize: 15)
            label_2.textColor = UIColor.white
            imageView.addSubview(label_2)
            cell.addSubview(imageView)
            return cell
        // margin
        } else if (indexPath.row == 1) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            let label = UILabel(frame: CGRect(x: 0, y: 0 , width: CGFloat(DeviceSize.screenWidth / 3 * 2), height: CGFloat(DeviceSize.screenWidth / 8)))
            label.text = " "+"♡いいね！"
            cell.addSubview(label)
            return cell
        // otherImages
        } else if (indexPath.row == 2) {
            let const: CGFloat = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2 - DeviceSize.screenWidth / 8 * 9)
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            scrollView =  UIScrollView(frame: CGRect(x: 0, y: 0, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2 - DeviceSize.screenWidth / 8 * 9)))
            scrollView.backgroundColor = UIColor.white
            scrollView.contentSize = CGSize(width: (const / 20 * 21) * CGFloat(self.otherImageCount), height: CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2 - DeviceSize.screenWidth / 8 * 9))
            // imageViews
            for i in 0..<self.otherImageCount {
                let imageView = UIImageView(frame: CGRect(x: (const / 20 * 21) * CGFloat(i), y: 0, width: const, height: const))
                imageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
                scrollView.addSubview(imageView)
            }
            cell.addSubview(scrollView)
            return cell
        // introduction
        } else if (indexPath.row == 3) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            // 自己紹介
            let label_1 = UILabel(frame: CGRect(x: const, y: const, width: DeviceSize.screenWidth - const * 2, height: const * 2))
            label_1.text = "自己紹介"
            label_1.font = UIFont.boldSystemFont(ofSize:20)
            label_1.textColor = UIColor.darkGray
            cell.addSubview(label_1)
            // 内容
            self.introductionContentLabel = UILabel()
            self.introductionContentLabel.frame.origin.x = CGFloat(const)
            self.introductionContentLabel.frame.origin.y = label_1.frame.origin.y + label_1.frame.height + CGFloat(const)
            self.introductionContentLabel.frame.size.width = CGFloat(DeviceSize.screenWidth - const * 2)
            self.introductionContentLabel.numberOfLines = 0
            self.introductionContentLabel.text = "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
            self.introductionContentLabel.sizeToFit()
            cell.addSubview(self.introductionContentLabel)
            return cell
        // profile
        } else if (indexPath.row == 4) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            // 基本プロフィール
            self.basisProfileLabel = UILabel()
            self.basisProfileLabel.text = "基本プロフィール"
            self.basisProfileLabel.font = UIFont.boldSystemFont(ofSize:20)
            self.basisProfileLabel.textColor = UIColor.darkGray
            self.basisProfileLabel.frame.origin.x = CGFloat(const)
            self.basisProfileLabel.frame.origin.y = CGFloat(const)
            self.basisProfileLabel.numberOfLines = 0
            self.basisProfileLabel.sizeToFit()
            cell.addSubview(self.basisProfileLabel)
            // profileItemLabel
            self.profileItemlabel = UILabel()
            self.profileItemlabel.text = "身長\n\n体型\n\n出身地\n\n子供の有無"
            self.profileItemlabel.textColor = UIColor.gray
            self.profileItemlabel.frame.origin.x = CGFloat(const)
            self.profileItemlabel.frame.origin.y = self.basisProfileLabel.frame.origin.y + self.basisProfileLabel.frame.size.height + CGFloat(const)
            self.profileItemlabel.frame.size.width = CGFloat(DeviceSize.screenWidth/2 - const)
            self.profileItemlabel.numberOfLines = 0
            self.profileItemlabel.sizeToFit()
            cell.addSubview(self.profileItemlabel)
            // prifileContentsLabel
            self.prifileContentsLabel = UILabel()
            self.prifileContentsLabel.text = "test\n\ntesttest\n\ntest\n\ntest"
            self.prifileContentsLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: CGFloat(const) + self.basisProfileLabel.frame.size.height + self.basisProfileLabel.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2) - CGFloat(const), height: self.profileItemlabel.frame.size.height)
            self.prifileContentsLabel.numberOfLines = 0
            //self.prifileContentsLabel.sizeToFit()
            self.prifileContentsLabel.textAlignment = .right
            cell.addSubview(self.prifileContentsLabel)
            return cell
        // future
        } else if (indexPath.row == 5) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            // 将来の夢
            self.futureLabel = UILabel()
            self.futureLabel.text = "将来の夢"
            self.futureLabel.font = UIFont.boldSystemFont(ofSize:20)
            self.futureLabel.textColor = UIColor.darkGray
            self.futureLabel.frame.origin.x = CGFloat(const)
            self.futureLabel.frame.origin.y = CGFloat(const)
            self.futureLabel.numberOfLines = 0
            self.futureLabel.sizeToFit()
            cell.addSubview(self.futureLabel)
            // contentItemLabel
            self.futureContentItemLabel = UILabel()
            self.futureContentItemLabel.text = "testtesttesttest\n"
            self.futureContentItemLabel.frame.origin.x = CGFloat(const)
            self.futureContentItemLabel.frame.origin.y = self.futureLabel.frame.origin.y + self.futureLabel.frame.size.height + CGFloat(const)
            self.futureContentItemLabel.frame.size.width = CGFloat(DeviceSize.screenWidth/2 - const)
            self.futureContentItemLabel.numberOfLines = 0
            self.futureContentItemLabel.sizeToFit()
            cell.addSubview(self.futureContentItemLabel)
            return cell
        // hope
        } else if (indexPath.row == 6) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            //
            self.hopeItemLabel = UILabel()
            self.hopeItemLabel.text = "出会うまでの希望・初回デート"
            self.hopeItemLabel.font = UIFont.boldSystemFont(ofSize:20)
            self.hopeItemLabel.textColor = UIColor.darkGray
            self.hopeItemLabel.frame.origin.x = CGFloat(const)
            self.hopeItemLabel.frame.origin.y = CGFloat(const)
            self.hopeItemLabel.sizeToFit()
            cell.addSubview(self.hopeItemLabel)
            //
            self.hope1Label = UILabel()
            self.hope1Label.text = "出会うまでの希望"
            self.hope1Label.frame.origin.x = CGFloat(const)
            self.hope1Label.textColor = UIColor.gray
            self.hope1Label.frame.origin.y = self.hopeItemLabel.frame.origin.y + self.hopeItemLabel.frame.height + CGFloat(const)
            self.hope1Label.sizeToFit()
            cell.addSubview(self.hope1Label)
            //
            self.hope2Label = UILabel()
            self.hope2Label.text = "初回デートで\n行きたい場所"
            self.hope2Label.frame.origin.x = CGFloat(const)
            self.hope2Label.frame.origin.y = self.hope1Label.frame.origin.y + self.hope1Label.frame.size.height + CGFloat(const)
            self.hope2Label.numberOfLines = 2
            self.hope2Label.textColor = UIColor.gray
            self.hope2Label.sizeToFit()
            cell.addSubview(self.hope2Label)
            //
            self.hope1ContentLabel = UILabel()
            self.hope1ContentLabel.text = "条件があえば会いたい"
            self.hope1ContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.hope1Label.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2 - const), height: hope1Label.frame.size.height)
            self.hope1ContentLabel.textAlignment = .right
            cell.addSubview(self.hope1ContentLabel)
            //
            self.hope2ContentLabel = UILabel()
            self.hope2ContentLabel.text = "どこでも"
            self.hope2ContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.hope1Label.frame.origin.y + self.hope1Label.frame.size.height + CGFloat(const), width: CGFloat(DeviceSize.screenWidth/2 - const), height: hope2Label.frame.size.height)
            self.hope2ContentLabel.textAlignment = .right
            cell.addSubview(self.hope2ContentLabel)
            
            return cell
        // private
        } else if (indexPath.row == 7) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            //
            self.privateItemLabel = UILabel()
            self.privateItemLabel.text = "性格・プライベート"
            self.privateItemLabel.font = UIFont.boldSystemFont(ofSize:20)
            self.privateItemLabel.textColor = UIColor.darkGray
            self.privateItemLabel.frame.origin.x = CGFloat(const)
            self.privateItemLabel.frame.origin.y = CGFloat(const)
            self.privateItemLabel.sizeToFit()
            cell.addSubview(self.privateItemLabel)
            //
            self.hobbyItemLabel = UILabel()
            self.hobbyItemLabel.text = "好きなこと・趣味"
            self.hobbyItemLabel.frame.origin.x = CGFloat(const)
            self.hobbyItemLabel.textColor = UIColor.gray
            self.hobbyItemLabel.frame.origin.y = self.privateItemLabel.frame.origin.y + self.privateItemLabel.frame.height + CGFloat(const)
            self.hobbyItemLabel.sizeToFit()
            cell.addSubview(self.hobbyItemLabel)
            //
            self.personalityaItemLabel = UILabel()
            self.personalityaItemLabel.text = "性格・タイプ"
            self.personalityaItemLabel.frame.origin.x = CGFloat(const)
            self.personalityaItemLabel.frame.origin.y = self.hobbyItemLabel.frame.origin.y + self.hobbyItemLabel.frame.size.height + CGFloat(const)
            self.personalityaItemLabel.numberOfLines = 2
            self.personalityaItemLabel.textColor = UIColor.gray
            self.personalityaItemLabel.sizeToFit()
            cell.addSubview(self.personalityaItemLabel)
            //
            self.liquorItemLabel = UILabel()
            self.liquorItemLabel.text = "お酒"
            self.liquorItemLabel.frame.origin.x = CGFloat(const)
            self.liquorItemLabel.frame.origin.y = self.personalityaItemLabel.frame.origin.y + self.personalityaItemLabel.frame.size.height + CGFloat(const)
            self.liquorItemLabel.numberOfLines = 2
            self.liquorItemLabel.textColor = UIColor.gray
            self.liquorItemLabel.sizeToFit()
            cell.addSubview(self.liquorItemLabel)
            //
            self.tabaccoItemLabel = UILabel()
            self.tabaccoItemLabel.text = "タバコ"
            self.tabaccoItemLabel.frame.origin.x = CGFloat(const)
            self.tabaccoItemLabel.frame.origin.y = self.liquorItemLabel.frame.origin.y + self.liquorItemLabel.frame.size.height + CGFloat(const)
            self.tabaccoItemLabel.numberOfLines = 2
            self.tabaccoItemLabel.textColor = UIColor.gray
            self.tabaccoItemLabel.sizeToFit()
            cell.addSubview(self.tabaccoItemLabel)
            //
            self.holidayItemLabel = UILabel()
            self.holidayItemLabel.text = "休日"
            self.holidayItemLabel.frame.origin.x = CGFloat(const)
            self.holidayItemLabel.frame.origin.y = self.tabaccoItemLabel.frame.origin.y + self.tabaccoItemLabel.frame.size.height + CGFloat(const)
            self.holidayItemLabel.numberOfLines = 2
            self.holidayItemLabel.textColor = UIColor.gray
            self.holidayItemLabel.sizeToFit()
            cell.addSubview(self.holidayItemLabel)
            //
            self.hobbyItemContentLabel = UILabel()
            self.hobbyItemContentLabel.text = "ああああ"
            self.hobbyItemContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.hobbyItemLabel.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2 - const), height: hobbyItemLabel.frame.size.height)
            self.hobbyItemContentLabel.textAlignment = .right
            cell.addSubview(self.hobbyItemContentLabel)
            //
            self.personalityItemContentLabel = UILabel()
            self.personalityItemContentLabel.text = "どこでも"
            self.personalityItemContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.personalityaItemLabel.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2 - const), height: personalityaItemLabel.frame.size.height)
            self.personalityItemContentLabel.textAlignment = .right
            cell.addSubview(self.personalityItemContentLabel)
            //
            self.liquorItemContentLabel = UILabel()
            self.liquorItemContentLabel.text = "どこでも"
            self.liquorItemContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.liquorItemLabel.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2 - const), height: self.liquorItemLabel.frame.size.height)
            self.liquorItemContentLabel.textAlignment = .right
            cell.addSubview(self.liquorItemContentLabel)
            //
            self.tabaccoItemContentLabel = UILabel()
            self.tabaccoItemContentLabel.text = "どこでも"
            self.tabaccoItemContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.tabaccoItemLabel.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2 - const), height: tabaccoItemLabel.frame.size.height)
            self.tabaccoItemContentLabel.textAlignment = .right
            cell.addSubview(self.tabaccoItemContentLabel)
            //
            self.holidayItemContentLabel = UILabel()
            self.holidayItemContentLabel.text = "どこでも"
            self.holidayItemContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2), y: self.holidayItemLabel.frame.origin.y, width: CGFloat(DeviceSize.screenWidth/2 - const), height: holidayItemLabel.frame.size.height)
            self.holidayItemContentLabel.textAlignment = .right
            cell.addSubview(self.holidayItemContentLabel)
            
            return cell
        // job
        } else if (indexPath.row == 8) {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.selectionStyle = .none
            //
            self.jobItemLabel = UILabel()
            self.jobItemLabel.text = "職業"
            self.jobItemLabel.font = UIFont.boldSystemFont(ofSize:20)
            self.jobItemLabel.textColor = UIColor.darkGray
            self.jobItemLabel.frame.origin.x = CGFloat(const)
            self.jobItemLabel.frame.origin.y = CGFloat(const)
            self.jobItemLabel.sizeToFit()
            cell.addSubview(self.jobItemLabel)
            //
            self.jobItem1Label = UILabel()
            self.jobItem1Label.text = "職業"
            self.jobItem1Label.frame.origin.x = CGFloat(const)
            self.jobItem1Label.frame.origin.y = self.jobItemLabel.frame.origin.y + self.jobItemLabel.frame.height + CGFloat(const)
            self.jobItem1Label.textColor = UIColor.gray
            self.jobItem1Label.sizeToFit()
            cell.addSubview(self.jobItem1Label)
            //
            self.jobItemContentLabel = UILabel()
            self.jobItemContentLabel.text = "会社員"
            self.jobItemContentLabel.frame = CGRect(x: CGFloat(DeviceSize.screenWidth / 2), y: self.jobItemLabel.frame.origin.y + self.jobItemLabel.frame.height + CGFloat(const), width: CGFloat(DeviceSize.screenWidth / 2 - const), height: self.jobItem1Label.frame.height)
            self.jobItemContentLabel.textAlignment = .right
            cell.addSubview(self.jobItemContentLabel)
            //
            return cell
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            return cell
        }
    }
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return CGFloat(DeviceSize.screenWidth)
        } else if (indexPath.row == 1) {
            return CGFloat(DeviceSize.screenWidth / 8)
        } else if (indexPath.row == 2) {
            return CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2 - DeviceSize.screenWidth / 8 * 9)
        } else if (indexPath.row == 3) {
            return self.introductionContentLabel.frame.origin.y + self.introductionContentLabel.frame.height + CGFloat(DeviceSize.navigationbarHeight / 3)
        } else if (indexPath.row == 4) {
            return self.introductionContentLabel.frame.origin.y + self.introductionContentLabel.frame.height + CGFloat(DeviceSize.navigationbarHeight / 3)
        } else if (indexPath.row == 5) {
            return self.futureContentItemLabel.frame.origin.y + self.futureContentItemLabel.frame.height + CGFloat(DeviceSize.navigationbarHeight / 3)
        } else if (indexPath.row == 6) {
            return self.hope2Label.frame.origin.y + self.hope2Label.frame.height + CGFloat(DeviceSize.navigationbarHeight / 3)
        } else if (indexPath.row == 7) {
            return self.holidayItemLabel.frame.origin.y + self.holidayItemLabel.frame.height + CGFloat(DeviceSize.navigationbarHeight / 3)
        } else if (indexPath.row == 8) {
            return self.jobItem1Label.frame.origin.y + self.jobItem1Label.frame.height + CGFloat(DeviceSize.navigationbarHeight / 3)
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
