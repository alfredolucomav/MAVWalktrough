//
//  MAVWalktroughViewController.swift
//  MAVWalktrough
//
//  Created by Mavericks's iOS Dev on 6/14/19.
//  Copyright © 2019 Mavericks. All rights reserved.
//

import UIKit

open class MAVWalktroughViewController: UIViewController {
    
    //MARK: - Global Variables
    open var logoName: String = ""{
        didSet{
            self.logoImageView.image = UIImage(named: logoName)
        }
    }
    
    private var enterTrigger: (()->Void)? = nil
    
    private var pageViewController: UIPageViewController = {
        var vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    public var assets: [MAVWalktroughAsset] = []{
        didSet{
            self.pageControl.numberOfPages = assets.count
            if let vc = self.instanceViewController(atIndex: 0){
                self.pageViewController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    open var currentIndicatorTintColor : UIColor = .black{
        didSet{
            self.pageControl.currentPageIndicatorTintColor = currentIndicatorTintColor
        }
    }
    
    open var indicatorTintColor: UIColor = .black{
        didSet{
            self.pageControl.pageIndicatorTintColor = indicatorTintColor
        }
    }
    
    open var titleFont: UIFont = UIFont.systemFont(ofSize: 17.0){
        didSet{
            if let vc = self.instanceViewController(atIndex: 0){
                self.pageViewController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    open var titleColor: UIColor = .black{
        didSet{
            if let vc = self.instanceViewController(atIndex: 0){
                self.pageViewController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    //MARK: - IBOUtlets
    @IBOutlet public weak var enterButton: MAVWalktroughButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var logoImageView: UIImageView!
    
    //MARK: - Initializers
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public convenience init(assets: [MAVWalktroughAsset],trigger: @escaping (() -> Void)){
        self.init(nibName: String(describing: MAVWalktroughViewController.self), bundle: Bundle(for: MAVWalktroughViewController.self))
        self.loadViewIfNeeded()
        self.assets = assets
        self.enterTrigger = trigger
    }
    
    open override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.currentPage = 0
        
        //Agrego el pager view
        self.addChild(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[pager]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["pager" : self.pageViewController.view ?? UIView()]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pager]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["pager" : self.pageViewController.view ?? UIView()]))
        self.pageViewController.view.layoutIfNeeded()
        self.pageViewController.didMove(toParent: self)
        
        self.view.bringSubviewToFront(self.logoImageView)
        self.view.bringSubviewToFront(self.pageControl)
        self.view.bringSubviewToFront(self.enterButton)
        
        //Agrego los delegados
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        
        self.enterButton.addTarget(self, action: #selector(enter), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    //MARK: - VC's instance
    
    func instanceViewController(atIndex: Int) -> UIViewController? {
        let vc = MAVWalktroughAssetViewController(nibName: String(describing: MAVWalktroughAssetViewController.self), bundle: Bundle(for: MAVWalktroughAssetViewController.self))
        vc.loadViewIfNeeded()
        vc.titleLabel.text = self.assets[atIndex].title
        vc.view.addBackground(named: self.assets[atIndex].imageName)
        vc.index = atIndex
        vc.textFont = self.titleFont
        vc.textColor = self.titleColor
        return vc
    }
    
    @objc func enter(){
        self.enterTrigger?()
    }
    
}

extension MAVWalktroughViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    //MARK: - Page view delegate
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let beforeVC = viewController as? MAVWalktroughAssetViewController{
            var index = beforeVC.index
            if(self.pageControl.currentPage != index){
                self.pageControl.currentPage = index
            }
            index = index + 1
            
            if(index >= self.assets.count){
                return nil
            }
            
            return self.instanceViewController(atIndex: index)
            
        }
        
        return nil
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let beforeVC = viewController as? MAVWalktroughAssetViewController{
            var index = beforeVC.index
            
            if(self.pageControl.currentPage != index){
                self.pageControl.currentPage = index
            }
            if(index == 0){
                return nil
            }
            
            index = index - 1
            
            return self.instanceViewController(atIndex: index)
            
        }
        return nil
    }
}
