//
//  ViewController.swift
//  3DTouch
//
//  Created by SnowCheng on 16/5/15.
//  Copyright © 2016年 SnowCheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabView = UITableView.init(frame: view.bounds, style: .Grouped)
        tabView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tabView.delegate = self
        tabView.dataSource = self
        view.addSubview(tabView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension ViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.accessoryType = .DisclosureIndicator
        
        registerForPreviewingWithDelegate(self, sourceView: cell)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row
        {
        case 0:
            navigationController?.pushViewController(ViewTouchController(), animated: true)
        case 1:
            navigationController?.pushViewController(DrawTouchController(), animated: true)
        default:
            break
        }
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let cell = previewingContext.sourceView as? UITableViewCell else {
            return nil
        }
        
        switch cell.textLabel?.text ?? ""
        {
        case "0":
            let touchVC = ViewTouchController()
            touchVC.preferredContentSize = CGSize.init(width: 0, height: 500)
            return touchVC
        case "1":
            let drawTouchVC = DrawTouchController()
            drawTouchVC.preferredContentSize = CGSize.init(width: 50, height: 300)
            return drawTouchVC
        default:
            return nil
        }

    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
        
    }
    
}