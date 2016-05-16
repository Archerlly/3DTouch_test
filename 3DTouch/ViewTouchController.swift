//
//  ViewTouchController.swift
//  3DTouch
//
//  Created by SnowCheng on 16/5/15.
//  Copyright © 2016年 SnowCheng. All rights reserved.
//

import UIKit

class ViewTouchController: UIViewController, UIViewControllerPreviewingDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orangeColor()
        title = "touchVC"
        
        let touchView = UIButton()
        touchView.layer.borderWidth = 1
        touchView.layer.borderColor = UIColor.blackColor().CGColor
        touchView.backgroundColor = UIColor.brownColor()
        touchView.setTitle("用力点我", forState: .Normal)
        touchView.bounds = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        touchView.center = view.center
        
        let rectView = UIView()
        rectView.frame = CGRect.init(x: 50, y: 50, width: 50, height: 50)
        rectView.backgroundColor = UIColor.lightGrayColor()
        
        view.addSubview(touchView)
        touchView.addSubview(rectView)
        
        let VCPreviewing = registerForPreviewingWithDelegate(self, sourceView: touchView)
        VCPreviewing.sourceRect = rectView.frame
    }
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        
        let item1 = UIPreviewAction.init(title: "item1", style: .Destructive) { (_, _) in
            print("viewTouch__item1")
        }
        
        let item2 = UIPreviewAction.init(title: "item2", style: .Default) { (_, _) in
            print("viewTouch__item2")
        }
        
        let item3 = UIPreviewAction.init(title: "item3", style: .Selected) { (_, _) in
            print("viewTouch__item3")
        }
        
        return [item1, item2, item3]
    }
    
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let drawVC = DrawTouchController()
        drawVC.preferredContentSize = CGSize.init(width: 150, height: 300)
        
        previewingContext.sourceRect = CGRect.init(x: 50, y: 50, width: 50, height: 50)
        
        return drawVC
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
        
    }
    
}
