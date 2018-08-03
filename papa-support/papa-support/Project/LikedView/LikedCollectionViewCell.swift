//
//  LikedCollectionViewCell.swift
//  App01
//
//  Created by Miamoto on 2018/05/28.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class LikedCollectionViewCell: UICollectionViewCell {
    
    open var label: UILabel!
    override init(frame: CGRect) {
        //タッチの検出を設定
        super.init(frame: frame)
        let View = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(DeviceSize.screenWidth/2), height: 50))
        self.label = UILabel()
        self.label.frame = CGRect(x: 0, y: 0, width:View.frame.width, height:50)
        self.label.textAlignment = NSTextAlignment.center
        self.label.center = View.center
        
        View.addSubview(label)
        
        self.backgroundColor = UIColor.darkGray
        self.addSubview(View)
        
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}
