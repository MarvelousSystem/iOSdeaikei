//
//  MessageListTableViewCell.swift
//  papa-support
//
//  Created by Miamoto on 2018/06/13.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//

import UIKit

class MessageListTableViewCell: UITableViewCell {
    
    var faceImageView: UIImageView!
    var faceImage: UIImage!
    var detail: UILabel!
    var matchingDate: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeUI()
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    func makeUI() {
        faceImage = UIImage()
        faceImageView = UIImageView(frame: CGRect(x: CGFloat(DeviceSize.MessageListViewCellHeight / 10 * 1), y: CGFloat(DeviceSize.MessageListViewCellHeight / 10 * 0.5), width: CGFloat(DeviceSize.MessageListViewCellHeight / 10 * 9), height: CGFloat(DeviceSize.MessageListViewCellHeight) / 10 * 9))
        detail = UILabel(frame: CGRect(x: CGFloat(DeviceSize.MessageListViewCellHeight / 10 * 12), y: CGFloat(DeviceSize.MessageListViewCellHeight / 8 * 1), width: CGFloat(DeviceSize.screenWidth - DeviceSize.MessageListViewCellHeight / 10 * 12 * 2), height: CGFloat(DeviceSize.MessageListViewCellHeight / 8 * 1 * 2)))
        self.addSubview(faceImageView)
        self.addSubview(detail)
    }
}
