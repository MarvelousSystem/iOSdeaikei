


import UIKit

class LikedViewTableViewCell: UITableViewCell {
    
    var faceImageView: UIImageView!
    var faceImage: UIImage!
    var name: UILabel!
    var age: UILabel!
    var birthplace: UILabel!
    var good_button:UIButton!
    var height: UILabel!
    var notOpenToPublic: UILabel!
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeUI()
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    func makeUI() {
        faceImage = UIImage()
        faceImageView = UIImageView(frame: CGRect(x: CGFloat(DeviceSize.LikedViewTableViewCellHeight / 10 * 1), y: CGFloat(DeviceSize.LikedViewTableViewCellHeight / 10 * 0.5), width: CGFloat(DeviceSize.LikedViewTableViewCellHeight / 10 * 9), height: CGFloat(DeviceSize.LikedViewTableViewCellHeight) / 10 * 9))
        self.addSubview(faceImageView)
        birthplace = UILabel()
        birthplace.text = "東京都"
        birthplace.frame = CGRect(x:faceImageView.layer.position.x+50, y: 0, width: 100, height:30)
        self.addSubview(birthplace)
        age = UILabel()
        age.text = "20歳"
        age.frame = CGRect(x: birthplace.frame.minX, y: birthplace.frame.maxY, width: birthplace.frame.width, height:birthplace.frame.height)
        self.addSubview(age)
        good_button = UIButton()
        good_button.frame = CGRect(x:age.layer.position.x, y:age.layer.position.y, width: 150, height:30)
        self.addSubview(good_button)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
