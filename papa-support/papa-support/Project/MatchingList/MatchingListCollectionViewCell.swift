//  Created by Miyamoto on 2018/05/23.
//  Copyright © 2018年 MiyamotoSota. All rights reserved.

import UIKit

class MatchingListCollectionViewCell: UICollectionViewCell {
    //変数宣言
    var myFaceImageView: UIImageView!
    var myFaceImage: UIImage!
    var myAgeLabel: UILabel!
    var myLivingPlace: UILabel!
    var myOnlineNotification: UIImageView!
    var myComment: UILabel!
    var myDatailView: UIView!
    //初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.myFaceImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height / 6 * 5))
        self.myComment = UILabel(frame: CGRect(x: 0, y: myFaceImageView.bounds.height / 5 * 4, width: myFaceImageView.bounds.width, height: myFaceImageView.bounds.height / 5 * 1))
        self.myComment.textColor = UIColor.white
        myFaceImageView.addSubview(myComment)
        self.addSubview(myFaceImageView)
        self.myDatailView = UIView(frame: CGRect(x: 0, y: self.bounds.height / 6 * 5, width: self.bounds.width, height: self.bounds.height / 6 * 1))
        self.myOnlineNotification = UIImageView(frame: CGRect(x: 0, y: 0, width: myDatailView.bounds.width / 10 * 1, height: myDatailView.bounds.height))
        myDatailView.addSubview(myOnlineNotification)
        self.myAgeLabel = UILabel(frame: CGRect(x: myDatailView.bounds.width / 10 * 1, y: 0, width: myDatailView.bounds.width / 10 * 2, height: myDatailView.bounds.height))
        myDatailView.addSubview(myAgeLabel)
        self.myLivingPlace = UILabel(frame: CGRect(x: myDatailView.bounds.width / 10 * 3, y: 0, width: myDatailView.bounds.width / 10 * 7, height: myDatailView.bounds.height))
        myDatailView.addSubview(myLivingPlace)
        self.addSubview(myDatailView)
        self.backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}
