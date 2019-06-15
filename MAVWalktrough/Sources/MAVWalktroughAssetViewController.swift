//
//  MAVWalktroughAssetViewController.swift
//  MAVWalktrough
//
//  Created by Mavericks's iOS Dev on 6/15/19.
//  Copyright © 2019 Mavericks. All rights reserved.
//

import UIKit

open class MAVWalktroughAssetViewController: UIViewController {

    //MARK: - IBOUtlets
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK - Variables
    var index: Int = 0
    
    open var textColor: UIColor = .black{
        didSet{
            self.titleLabel.textColor = textColor
        }
    }
    
    open var textFont: UIFont = UIFont.systemFont(ofSize: 17.0){
        didSet{
            self.titleLabel.font = textFont
        }
    }
    
    override open func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
