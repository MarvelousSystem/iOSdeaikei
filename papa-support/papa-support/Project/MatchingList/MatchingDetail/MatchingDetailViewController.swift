


import UIKit

// MARK: vars and lifecycle
class MatchingDetailViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var otherImageCount: Int = 7 //<- test
    
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
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    // buttonView
    func setButtonView() {
        let buttonView: UIView = UIView(frame: CGRect(x: 0, y: self.view.bounds.height - CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight), width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.navigationbarHeight + DeviceSize.statusBarHeight)))
        buttonView.backgroundColor = UIColor.white
        self.view.addSubview(buttonView)
        // 定数
        let const: CGFloat = CGFloat(DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight) / 8
        // button
        let likeButton: UIButton = UIButton(frame: CGRect(x: 0 + const, y: const + self.view.bounds.height - buttonView.bounds.height, width: buttonView.bounds.width / 4 * 3 - const * 1, height: buttonView.bounds.height - const * 2))
        likeButton.backgroundColor = UIColor(hex: "7fffd4")
        likeButton.setTitle("♡いいね！", for: UIControl.State.normal)
        likeButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        likeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        likeButton.layer.cornerRadius = 5
        likeButton.addTarget(self, action: #selector(self.tapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(likeButton)
        // button
        let messageButton: UIButton = UIButton(frame: CGRect(x: const + buttonView.bounds.width / 4 * 3, y: self.view.bounds.height - buttonView.bounds.height + const, width: buttonView.bounds.width / 4 * 1 - const * 2, height: buttonView.bounds.height - const * 2))
        messageButton.backgroundColor = UIColor(hex: "7fffd4")
        messageButton.setTitleColor(UIColor.white , for: UIControl.State.normal)
        messageButton.setTitle("DM", for: UIControl.State.normal)
        messageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        messageButton.layer.cornerRadius = 5
        messageButton.addTarget(self, action: #selector(self.messageButtonTapped), for: UIControl.Event.touchUpInside)
        self.view.addSubview(messageButton)
    }
    @objc func tapped() {
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
        return 6
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // image
        if indexPath.row == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
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
            let label = UILabel(frame: CGRect(x: 0, y: 0 , width: CGFloat(DeviceSize.screenWidth / 3 * 2), height: CGFloat(DeviceSize.screenWidth / 8)))
            label.text = " "+"♡いいね！"
            cell.addSubview(label)
            return cell
        // otherImages
        } else if (indexPath.row == 2) {
            let const: CGFloat = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2 - DeviceSize.screenWidth / 8 * 9)
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
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
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return CGFloat(DeviceSize.screenWidth)
        } else if (indexPath.row == 1) {
            return CGFloat(DeviceSize.screenWidth / 8)
        } else if (indexPath.row == 2) {
            return CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2 - DeviceSize.screenWidth / 8 * 9)
        } else {
            return 40
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
