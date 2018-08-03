


import UIKit

// MARK: vars and lifecycle
class LikedFromViewController: UIViewController{
    
    //var totalFavView = TotalFavView()
    open var good_count = 10 //相手からもらったいいねの数
    open var people_count = 30
    open var user_name = "Dummy" // <- ユーザーの名前
    private var MatchinViewIsHidden:Bool! = false
    private var myTableView: [UITableView] = []
    private var scrollView: UIScrollView!
    private var collectionView: UICollectionView!
    private var Button_array = Array<UIButton>()
    private var FormUser_Button_array = Array<UIButton>()
    private var selectedIndexPath: IndexPath = IndexPath(row: 0, section: 0)
    private let Title_Label:UILabel! = UILabel()
    private let PageSize = 2
    private let PageList = ["お相手から", "あなたから"]
    private let Sections: NSArray = ["今日", "7/11(水)","7/7(土)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: DeviceSize.screenWidth, height: DeviceSize.screenHeight)
        UserDefaults.standard.set(false,forKey: "MatchingViewisHidden")
        SetTtile()
        SetScrollerView()
        SetTableView()
        SetCollectionViewSet()
        SetTableViewButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        let btn = UIBarButtonItem(image: UIImage(named:"icon_reload.png"), style:UIBarButtonItem.Style.done, target: self, action: #selector(Reload_Tablecell(_ :)))
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.topItem?.rightBarButtonItem = btn
        navigationController?.tabBarController?.tabBar.alpha = 1
        if UserDefaults.standard.bool(forKey: "MatchingViewisHidden"){
            MatchinViewIsHidden = true
        }
    }
    @objc func Reload_Tablecell(_ sender:UIButton){
        self.myTableView[0].reloadData()
        self.myTableView[1].reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //setTitleの設定.
    func SetTtile(){
        Title_Label.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/2.6), y: 60, width: CGFloat(DeviceSize.screenWidth), height: 30)
        Title_Label.text = "  \(good_count)いいね！"
        Title_Label.textColor = UIColor.black
        Title_Label.font = UIFont.systemFont(ofSize: CGFloat(20))
        
        let SubTitle:UILabel! = UILabel()
        SubTitle.frame = CGRect(x:0, y: -10, width: CGFloat(DeviceSize.screenWidth), height: 15)
        SubTitle.text = "一ヶ月の合計いいね数"
        SubTitle.textColor = UIColor.gray
        SubTitle.font = UIFont.systemFont(ofSize: CGFloat(12))
        
        self.Title_Label.addSubview(SubTitle)
        
        let underBorder = CALayer()
        underBorder.frame = CGRect(x: 0, y: Title_Label.frame.maxY, width:  CGFloat(DeviceSize.screenWidth), height: 1.0)
        underBorder.backgroundColor = UIColor.lightGray.cgColor
        
        self.view.layer.addSublayer(underBorder)
        
    }
    // TableViewの設定.
    func SetTableView() {
        for  i in  0 ... PageSize{
            let tableView: UITableView!
            if(i == 0){//お相手からTableView
                tableView = UITableView(frame:CGRect(x:  CGFloat(i) * self.view.frame.maxX, y: 100, width: CGFloat(DeviceSize.screenWidth), height: self.view.frame.height-190))
                
            }else{//あなたからTableView
                tableView = UITableView(frame:CGRect(x:  CGFloat(i) * self.view.frame.maxX, y: 45, width: CGFloat(DeviceSize.screenWidth), height: self.view.frame.height-150))
            }
            tableView.separatorStyle = .none
            myTableView.append(tableView)
            myTableView[i].register(LikedViewTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(LikedViewTableViewCell.self))
            myTableView[i].delegate   =   self
            myTableView[i].dataSource =   self
            scrollView.addSubview(myTableView[i])
        }
    }
    // ScrollViewの設定.
    func SetScrollerView(){
        let width = CGFloat(DeviceSize.screenWidth), height = self.view.bounds.height
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: CGFloat(DeviceSize.screenWidth), height: self.view.bounds.height))
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:CGFloat(PageSize) * width, height:height)
        scrollView.addSubview(Title_Label)
        self.view.addSubview(scrollView)
    }
    func SetCollectionViewSet() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.itemSize = CGSize(width: self.view.bounds.width / 2 ,  height: 50)
        let rec: CGRect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: CGFloat(Title_Label.frame.height)+10)
        collectionView = UICollectionView(frame: rec, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        self.view.bringSubviewToFront(collectionView)
    }
    func SetTableViewButton(){
        for j in 0 ... Sections.count-1{
            for i in 0 ... people_count{
                let btn = UIButton()
                btn.setTitle("❤️いいね！ありがとう", for: .normal)
                btn.tintColor = UIColor.white
                btn.backgroundColor = UIColor(hex: "66cdaa")
                Button_array.append(btn)
            }
        }
        print("button_array\(Button_array.count)")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var tmp = self.collectionView.cellForItem(at: selectedIndexPath)
        tmp?.backgroundColor = UIColor.darkGray
        if(scrollView.contentOffset.x > 200){
            tmp?.alpha = 0.5
            selectedIndexPath = IndexPath(row: 1, section: 0)
            tmp = self.collectionView.cellForItem(at: selectedIndexPath)
            tmp?.alpha = (scrollView.contentOffset.x-200)*0.01
            print("row = 1\(tmp?.alpha)")
        }else if (scrollView.contentOffset.x>0) {
            tmp?.alpha = 0.5
            selectedIndexPath = IndexPath(row: 0, section: 0)
            tmp = self.collectionView.cellForItem(at: selectedIndexPath)
            tmp?.alpha = (190-scrollView.contentOffset.x)*0.01
            print("row = 0\(tmp?.alpha)")
        }
        tmp?.backgroundColor = UIColor.red
    }
}
// MARK: UITableView DataSource and UITableView Delegate
extension LikedFromViewController: UITableViewDelegate, UITableViewDataSource {
    
    // number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people_count
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LikedViewTableViewCell.self)) as! LikedViewTableViewCell
        if (tableView === myTableView[0]){
            
            if indexPath.section == 0{
                cell.faceImage = ErrorSet.errorImage001
                cell.faceImageView.image = cell.faceImage
                cell.birthplace.text = "千葉県"
                cell.age.text = "25歳"
                cell.good_button.addTarget(self, action: #selector(LikedFromViewController.Plus_Good_count(_:)), for:.touchUpInside)
                cell.good_button.tag = indexPath.row
                print("Cell_good_button\(cell.good_button.tag )")
                cell.good_button.backgroundColor = Button_array[cell.good_button.tag].backgroundColor
                cell.good_button.setTitle(Button_array[cell.good_button.tag].currentTitle, for: .normal)
                cell.good_button.isEnabled = Button_array[cell.good_button.tag].isEnabled
            }else if indexPath.section == 1{
                cell.faceImage = ErrorSet.errorImage001
                cell.faceImageView.image = cell.faceImage
                cell.birthplace.text = "大阪府"
                cell.age.text = "30歳"
                cell.good_button.addTarget(self, action: #selector(LikedFromViewController.Plus_Good_count(_:)), for:.touchUpInside)
                cell.good_button.tag = indexPath.row + people_count * 1
                print("Cell_good_button\(cell.good_button.tag )")
                cell.good_button.backgroundColor = Button_array[cell.good_button.tag].backgroundColor
                cell.good_button.setTitle(Button_array[cell.good_button.tag].currentTitle, for: .normal)
                cell.good_button.isEnabled = Button_array[cell.good_button.tag].isEnabled
            } else{
                cell.faceImage = ErrorSet.errorImage001
                cell.faceImageView.image = cell.faceImage
                cell.birthplace.text = "東京都"
                cell.age.text = "28歳"
                cell.good_button.addTarget(self, action: #selector(LikedFromViewController.Plus_Good_count(_:)), for:.touchUpInside)
                cell.good_button.tag = indexPath.row + people_count * 2
                print("Cell_good_button\(cell.good_button.tag )")
                cell.good_button.backgroundColor = Button_array[cell.good_button.tag].backgroundColor
                cell.good_button.setTitle(Button_array[cell.good_button.tag].currentTitle, for: .normal)
                cell.good_button.isEnabled = Button_array[cell.good_button.tag].isEnabled
            }
            
        }else if (tableView === myTableView[1]){
            //cell 設定　両方いいねで　メッセージ送るボタン　　向こう片方いいねで　いいね済み
            cell.faceImage = ErrorSet.errorImage001
            cell.faceImageView.image = cell.faceImage
            cell.good_button.addTarget(self, action: #selector(LikedFromViewController.Good_formUser(_:)), for:.touchUpInside)
            cell.good_button.tag = indexPath.row
            if(indexPath.row%2==0){
                cell.good_button.setTitle("🖤いいね！済み", for: .normal)
                cell.good_button.layer.borderColor = UIColor.gray.cgColor
                cell.good_button.layer.borderWidth = 0.5
                cell.good_button.setTitleColor(UIColor.black, for: .normal)
                cell.good_button.backgroundColor = UIColor.white
                cell.good_button.isEnabled = false
            }else{
                cell.good_button.setTitle("✉️メッセージを送る", for: .normal)
                
            }
            cell.age.text = "25歳"
            cell.birthplace.text = "千葉県"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections[section] as? String
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // ヘッダーViewの高さを返す
        return 40
    }
    @objc func Plus_Good_count(_ sender: UIButton) {
        if (sender.titleLabel?.text == "❤️いいね！ありがとう"){
            sender.setTitle("✉️メッセージを送る", for: .normal)
            Button_array[sender.tag].isEnabled = false
            Button_array[sender.tag].setTitle("✉️メッセージを送る", for: .normal)
            if(!MatchinViewIsHidden){
                self.MatchingViewAppeared(tag:sender.tag)
            }
        }else{
            go_MessageView(advater_name: "テスト2")
        }
    }
    @objc func Good_formUser(_ sender: UIButton) {
        go_MessageView(advater_name: "テスト2")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(DeviceSize.LikedViewTableViewCellHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    func MatchingViewAppeared(tag:Int){
        let nextVC = MatchingViewController()
        nextVC.adavterName = "テスト"
        nextVC.adavterImage = ErrorSet.errorImage001
        self.present(nextVC,animated: true)
    }
    func go_MessageView(advater_name:String){
        let VC = MessageViewController()
        VC.senderId = user_name
        VC.senderDisplayName = "A"
        VC.advaterName = advater_name
        self.navigationController?.pushViewController(VC,animated: true)
    }
}
// MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension LikedFromViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(LikedCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self))
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self), for: indexPath) as!LikedCollectionViewCell
        cell.alpha = 0.5
        cell.isUserInteractionEnabled = true
        cell.label.textColor = UIColor.white
        cell.label.text = PageList[indexPath.row]
        cell.label.font = UIFont.systemFont(ofSize: CGFloat(20))
        self.collectionView.cellForItem(at: selectedIndexPath)?.backgroundColor = UIColor.red
        self.collectionView.cellForItem(at: selectedIndexPath)?.alpha = 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // tops == お相手から Page = 0
        if(indexPath.row == 0){
            self.scrollView.setContentOffset(CGPoint(x:self.scrollView.frame.width * CGFloat(0), y: self.scrollView.bounds.origin.y), animated: true)
        }else{
            self.scrollView.setContentOffset(CGPoint(x:self.scrollView.frame.width * CGFloat(1), y: self.scrollView.bounds.origin.y), animated: true)
        }
    }
    
}




