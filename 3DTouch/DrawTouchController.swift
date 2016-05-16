//
//  DrawTouchController.swift
//  3DTouch
//
//  Created by SnowCheng on 16/5/15.
//  Copyright © 2016年 SnowCheng. All rights reserved.
//

import UIKit

class DrawTouchController: UIViewController {
    
    let positionLable = UILabel()
    let forceLable = UILabel()
    let imageView = UIImageView()
    
    var lastPoint = CGPointZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGrayColor()
        title = "drawVC"
        
        positionLable.frame = CGRect.init(x: 0, y: 50, width: 200, height: 50)
        forceLable.frame = CGRect.init(x: 200, y: 50, width: 200, height: 50)
        imageView.frame = view.bounds
        
        view.addSubview(positionLable)
        view.addSubview(forceLable)
        view.addSubview(imageView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastPoint = touches.first?.locationInView(view) ?? CGPointZero
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first ?? UITouch()
        let currentPoint = touch.locationInView(view) ?? CGPointZero
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        imageView.image?.drawInRect(view.bounds)
        
        let path = UIBezierPath()
        path.moveToPoint(lastPoint)
        path.addLineToPoint(currentPoint)
        path.lineWidth = touch.force * 5
        path.lineJoinStyle = .Round
        path.lineCapStyle = .Round
        path.stroke()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        positionLable.text = "x:\(currentPoint.x), y:\(currentPoint.y)"
        forceLable.text = "force: \(touch.force)"
        
        lastPoint = currentPoint
    }
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        
        let item1 = UIPreviewAction.init(title: "item1", style: .Destructive) { (_, _) in
            print("viewTouch__item1")
            let rootVC = UIApplication.sharedApplication().keyWindow?.rootViewController as? UINavigationController
            rootVC?.pushViewController(self, animated: true)
        }
        
        let item2 = UIPreviewAction.init(title: "item2", style: .Default) { (_, _) in
            print("viewTouch__item2")
        }
        
        let item3 = UIPreviewAction.init(title: "item3", style: .Selected) { (_, _) in
            print("viewTouch__item3")
        }
        
        let item4 = UIPreviewAction.init(title: "item4", style: .Selected) { (_, _) in
            print("viewTouch__item3")
        }
        
        let item5 = UIPreviewAction.init(title: "item5", style: .Selected) { (_, _) in
            print("viewTouch__item3")
        }
        
        let group1 = UIPreviewActionGroup.init(title: "group1", style: .Destructive, actions: [item1, item2])
        
        let group2 = UIPreviewActionGroup.init(title: "group2", style: .Default, actions: [item3, item4])
        
        let group3 = UIPreviewActionGroup.init(title: "group3", style: .Selected, actions: [item5])
        
        return [group1, group2, group3]
    }
    
    
}
