//
//  MAVWalktroughButton.swift
//  MAVWalktrough
//
//  Created by Mavericks's iOS Dev on 6/14/19.
//  Copyright © 2019 Mavericks. All rights reserved.
//

import UIKit
import MaterialComponents

open class MAVWalktroughButton: MDCButton {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 8.0
    }

}
