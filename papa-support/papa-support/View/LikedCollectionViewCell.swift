//
//  LikedCollectionViewCell.swift
//  App01
//
//  Created by Miamoto on 2018/05/28.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class LikedCollectionViewCell: UICollectionViewCell {
    
    var view: UIView!
    var label: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat(DeviceSize.navigationbarHeight / 5 * 4)))
        self.label = UILabel()
        self.label.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        self.label.textAlignment = NSTextAlignment.center
        self.label.center = self.view.center
        view.addSubview(label)
        self.backgroundColor = UIColor.white
        self.addSubview(view)
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}
