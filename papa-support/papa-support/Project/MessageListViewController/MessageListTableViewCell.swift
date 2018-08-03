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
        faceImageView.layer.cornerRadius = faceImageView.frame.width * 0.5
        faceImageView.clipsToBounds = true
        detail = UILabel(frame: CGRect(x: CGFloat(DeviceSize.MessageListViewCellHeight / 10 * 12), y: CGFloat(DeviceSize.MessageListViewCellHeight / 8 * 1), width: CGFloat(DeviceSize.screenWidth) , height: CGFloat(DeviceSize.MessageListViewCellHeight / 8 * 1 * 2)))
        matchingDate =  UILabel(frame: CGRect(x: CGFloat(DeviceSize.MessageListViewCellHeight / 10 * 12), y: detail.frame.maxY+10, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.MessageListViewCellHeight / 8 * 1 * 2)))
        matchingDate.text = "お相手からメッセージが届いています"
        matchingDate.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(faceImageView)
        self.addSubview(detail)
        self.addSubview(matchingDate)
    }
}
