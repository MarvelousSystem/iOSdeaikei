


import UIKit

// MARK: vars and lifecycle
class MatchingDetailViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView = MatchingListDetailScrollView()
    // 前画面で選択されたCollectionCellのindexPath.row
    let indexPathRowOfCell = MatchingListPresenter.indexPathRowOfCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        setButtonView()
        setScrollView()
        print("MatchingDetailViewController:\(indexPathRowOfCell)")
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // scrollView
    func setScrollView() {
        self.scrollView.frame = CGRect(x: 0, y: CGFloat(DeviceSize.navigationbarHeight), width: self.view.bounds.width, height: self.view.bounds.height - CGFloat(DeviceSize.navigationbarHeight * 2 + DeviceSize.statusBarHeight))
        self.scrollView.firstImage = #imageLiteral(resourceName: "test.png")
        self.scrollView.firstImageView.image = self.scrollView.firstImage
        // commentLabel
        self.scrollView.comment1Label.text = "　テスト　テスト歳　テスト県"
        self.scrollView.comment2Label.text = "　これはテストです"
        self.view.addSubview(scrollView)
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
