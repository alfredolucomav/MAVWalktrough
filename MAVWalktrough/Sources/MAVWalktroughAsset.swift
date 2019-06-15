//
//  MAVWalktroughAsset.swift
//  MAVWalktrough
//
//  Created by Mavericks's iOS Dev on 6/15/19.
//  Copyright © 2019 Mavericks. All rights reserved.
//

import Foundation

public class MAVWalktroughAsset{
    open var imageName: String
    open var title: String
    
    public init(image: String, title: String) {
        self.imageName = image
        self.title = title
    }
}
