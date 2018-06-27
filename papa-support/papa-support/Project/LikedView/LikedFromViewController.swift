


import UIKit

// MARK: vars and lifecycle
class LikedFromViewController: UIViewController{
    
    //var totalFavView = TotalFavView()
    public var good_count = 10
    public var people_count = 30
    private var myTableView: [UITableView] = []
    // UIScrillView.
    private var scrollView: UIScrollView!
    private let title_Label:UILabel! = UILabel()
    private let pageSize = 2
    private var pageControl: UIPageControl!
    private let pageList = ["お相手から", "あなたから"]
    private var collectionView: UICollectionView!
    private var Button_array = Array<UIButton>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetTtile()
        SetScrollerView()
        SetTableView()
        SetCollectionViewSet()
        SetTableViewButton()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func Plus_Good_count(_ sender: UIButton) {
        if (sender.isEnabled == true){
            good_count+=1
            title_Label.text = "今月のいいねは\(good_count)個数"
            sender.isEnabled = false
            sender.backgroundColor = UIColor.darkGray
            sender.setTitle("いいねしました", for: .normal)
            Button_array[sender.tag].isEnabled = false
            Button_array[sender.tag].backgroundColor = UIColor.darkGray
            Button_array[sender.tag].setTitle("いいねしました", for: .normal)
            
        }
    }
    
    //setTitleの設定.
    func SetTtile(){
        title_Label.frame = CGRect(x: CGFloat(DeviceSize.screenWidth/3), y: 10, width: CGFloat(DeviceSize.screenWidth), height: 30)
        title_Label.text = "今月のいいねは\(good_count)個数"
        title_Label.textColor = UIColor.black
        title_Label.font = UIFont.systemFont(ofSize: CGFloat(20))
        
    }
    
    // TableViewの設定.
    func SetTableView() {
        for  i in  0 ... pageSize{
            let tableView: UITableView!
            if(i == 0){//お相手からTableView
                tableView = UITableView(frame:CGRect(x:  CGFloat(i) * self.view.frame.maxX, y: 35, width: CGFloat(DeviceSize.screenWidth), height: self.view.frame.height-180))
            }else{//あなたからTableView
                tableView = UITableView(frame:CGRect(x:  CGFloat(i) * self.view.frame.maxX, y: 5, width: CGFloat(DeviceSize.screenWidth), height: self.view.frame.height-150))
            }
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
        scrollView.contentSize = CGSize(width:CGFloat(pageSize) * width, height:height)
        scrollView.addSubview(title_Label)
        self.view.addSubview(scrollView)
    }
    
    
    func SetCollectionViewSet() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.itemSize = CGSize(width: self.view.bounds.width / 2 ,  height: CGFloat(DeviceSize.navigationbarHeight / 5 * 4))
        let rec: CGRect = CGRect(x: 0, y: -20, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(title_Label.frame.height))
        collectionView = UICollectionView(frame: rec, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        // Layer
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: self.collectionView.bounds.height - 1.0, width: self.collectionView.bounds.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.collectionView.layer.addSublayer(topBorder)
    }
    
    func SetTableViewButton(){
        for i in 0 ... people_count{
            let btn = UIButton()
            btn.setTitle("いいね！", for: .normal)
            btn.tintColor = UIColor.black
            btn.backgroundColor = UIColor.green
            Button_array.append(btn)
        }
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
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(LikedViewTableViewCell.self)) as! LikedViewTableViewCell
        
        if (tableView === myTableView[0]){
            cell.faceImage = ErrorSet.errorImage001
            cell.faceImageView.image = cell.faceImage
            cell.good_button.addTarget(self, action: #selector(LikedFromViewController.Plus_Good_count(_:)), for:.touchUpInside)
            cell.good_button.tag = indexPath.row
            cell.good_button.backgroundColor = Button_array[indexPath.row].backgroundColor
            cell.good_button.setTitle(Button_array[indexPath.row].currentTitle, for: .normal)
            cell.good_button.isEnabled = Button_array[indexPath.row].isEnabled
            
            
        }else if (tableView === myTableView[1]){
            cell.faceImage = ErrorSet.errorImage001
            cell.faceImageView.image = cell.faceImage
            cell.good_button.addTarget(self, action: #selector(LikedFromViewController.Plus_Good_count(_:)), for:.touchUpInside)
            cell.good_button.tag = indexPath.row
            cell.good_button.isEnabled = false
            cell.good_button.setTitle("いいね", for: .normal)
            cell.good_button.backgroundColor = UIColor.green
            cell.age.text = "25歳"
            cell.birthplace.text = "千葉県"
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(DeviceSize.LikedViewTableViewCellHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}
// MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension LikedFromViewController: UICollectionViewDelegate, UICollectionViewDataSource ,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(LikedCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self))
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self), for: indexPath) as!
        LikedCollectionViewCell
        cell.label.text = pageList[indexPath.row]
        cell.label.font = UIFont.systemFont(ofSize: CGFloat(20))
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



