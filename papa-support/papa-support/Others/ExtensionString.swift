//
//  ExtensionStrinfg.swift
//  papa-support
//
//  Created by Miamoto on 2018/07/07.
//  Copyright © 2018年 MiyamotoSouta. All rights reserved.
//
import UIKit

extension String {
    public func widthOfString(usingFont font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: attributes)
        return size.width
    }
    
    public func heightOfString(usingFont font: UIFont) -> CGFloat {
        let attributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: attributes)
        return size.height
    }
}
