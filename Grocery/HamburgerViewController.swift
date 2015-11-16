//
//  HamburgerViewController.swift
//  Grocery
//
//  Created by Mukesh Jain on 11/15/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    @IBOutlet weak var menuView: UIView!

    @IBOutlet weak var contentView: UIView!
    var menuViewController: UIViewController!
    var deptViewController: UIViewController!
    var contentInitialOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        deptViewController = storyboard.instantiateViewControllerWithIdentifier("DeptViewController")
        
        menuView.addSubview(menuViewController.view)
        contentView.addSubview(deptViewController.view)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onPanGesture(sender: UIPanGestureRecognizer) {
        print("pan")
        
        let location = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began{
            contentInitialOrigin = contentView.frame.origin
            
        } else if sender.state == UIGestureRecognizerState.Changed{
            contentView.frame.origin = CGPointMake(contentInitialOrigin.x + translation.x, contentInitialOrigin.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended{
            if velocity.x < 0 {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.contentView.frame.origin = CGPointMake(0, 0)
                })
                
            } else {
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.contentView.frame.origin = CGPointMake(self.contentView.frame.size.width - 40, 0)                })
                
            }
            
        }

    }

}
