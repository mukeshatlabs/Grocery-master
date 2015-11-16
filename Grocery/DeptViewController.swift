//
//  DeptViewController.swift
//  Grocery
//
//  Created by Mukesh Jain on 11/14/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class DeptViewController: UIViewController {

    
    @IBOutlet weak var deptCollectionView: UICollectionView!
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    let totalDepts: Int = 5
    let totalItems: Int = 6
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        deptCollectionView.dataSource = self
        itemCollectionView.dataSource = self

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

    @IBAction func onDeptLeftClick(sender: AnyObject) {
        
        /*
        let layout = deptCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    
        if layout.scrollDirection == UICollectionViewScrollDirection.Vertical {
            layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
            print("horizontal")
            //layout.itemSize = CGSizeMake(322,82)
            
            
        } else {
            layout.scrollDirection = UICollectionViewScrollDirection.Vertical
            print("vertical")
            //layout.itemSize = CGSizeMake(322,82)
            
        }
        */
    }
    
    
    @IBAction func onDeptRightClick(sender: AnyObject) {
    }
}

extension DeptViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.deptCollectionView {
            return totalDepts
        } else {
            return totalItems
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == self.deptCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DeptCell", forIndexPath: indexPath) as! DeptCell
            cell.deptImage.image = UIImage(named: "dept\(indexPath.row+1)")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
            cell.ItemImage.image = UIImage(named: "fav\(indexPath.row+1)")
            return cell
            
        }
    }

}