


import UIKit

class LikedViewTableViewCell: UITableViewCell {

    var faceImageView: UIImageView!
    var faceImage: UIImage!
    var name: UILabel!
    var age: UILabel!
    var birthplace: UILabel!
    var height: UILabel!
    var notOpenToPublic: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
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
    }
}
