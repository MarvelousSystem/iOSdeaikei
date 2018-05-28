//
//  TotalFavView.swift
//  App01
//
//  Created by Miamoto on 2018/05/28.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class TotalFavView: UIView {
    
    var titleLabel: UILabel!
    var totalFav: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        //TitleLabel
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: self.bounds.height / 4 * 1, width: self.bounds.width, height: self.bounds.height / 4 * 1))
        self.titleLabel.sizeToFit()
        self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.center = self.center
        //TotalFav
        self.totalFav = UILabel(frame: CGRect(x: 0, y: self.bounds.height / 4 * 2, width: self.bounds.width, height: self.bounds.height / 4 * 1))
        self.titleLabel.sizeToFit()
        self.totalFav.textAlignment = NSTextAlignment.center
        self.totalFav.center = self.center
        //Add
        self.addSubview(titleLabel)
        self.addSubview(totalFav)
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
}
