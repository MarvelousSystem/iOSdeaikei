


import UIKit

class LikedFromViewController: UIViewController {
    
    var totalFavView = TotalFavView()
    var tableView: UITableView! = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetTotalFavView()
        SetTotalFavViewLabel()
        SetTableView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // TotalFavView
    func SetTotalFavView() {
        totalFavView.frame = CGRect(x: 0, y: 0, width: DeviceSize.screenWidth, height: DeviceSize.navigationbarHeight * (1 / 5 * 4 * 2))
        totalFavView.backgroundColor = UIColor.white
        totalFavView.titleLabel.text = "test"
        totalFavView.totalFav.text = "test" + "いいね！"
        totalFavView.totalFav.textColor = UIColor.black
        totalFavView.addSubview(totalFavView.titleLabel)
        totalFavView.addSubview(totalFavView.totalFav)
        view.addSubview(totalFavView)
        // Layer
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        tableView.layer.addSublayer(topBorder)
    }
    // なんかTotalFavViewの表示がおかしいから一時的に
    func SetTotalFavViewLabel() {
        var titleLabel: UILabel!
        var totalFav: UILabel!
        titleLabel = UILabel(frame: CGRect(x:self.view.bounds.width/2,y:0,width:self.view.bounds.width,height:50))
        titleLabel.text = "test"
        view.addSubview(titleLabel)
    }
    // TableView
    func SetTableView() {
        tableView.frame = CGRect(x: 0, y: totalFavView.bounds.height, width: CGFloat(DeviceSize.screenWidth), height: self.view.bounds.height - totalFavView.bounds.height)
        self.view.addSubview(tableView)
    }
}
