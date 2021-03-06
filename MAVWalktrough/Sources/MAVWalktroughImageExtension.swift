//
//  MAVWalktroughImageExtension.swift
//  MAVWalktrough
//
//  Created by Mavericks's iOS Dev on 6/15/19.
//  Copyright © 2019 Mavericks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBackground(named: String, contentMode: UIView.ContentMode = .scaleAspectFill, backgroundColor: UIColor) {
        // screen width and height:
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x:0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: named)
        imageViewBackground.backgroundColor = backgroundColor
        
        // you can change the content mode:
        imageViewBackground.contentMode = contentMode
        imageViewBackground.clipsToBounds = true
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
