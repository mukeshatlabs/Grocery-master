//
//  ShelfViewController.swift
//  Grocery
//
//  Created by Mukesh Jain on 11/4/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var products:[NSDictionary]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = NSURL(string: "http://api.walmartlabs.com/v1/search?apiKey=vxuu9yx4wczhgry6emhe7dp9&query=grocery")!
        let request = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
            
            if let json = json{
                self.products = json["items"] as! [NSDictionary]
                self.tableView.reloadData()
                //print("total count \(self.products!.count) ")
            }
            
            //print(json)
            
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        //print("in table view ")
        if let products = products {
            print("total count \(products.count) ")
            return products.count
            
        } else {
            print("total count is zero ")
            return 0
        }
        
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as!  ProductCell
        
        let product = products![indexPath.row]
        
        cell.descLabel.text = ""
        
        let encodedString = product["shortDescription"] as? String
        
        if encodedString != nil {
            let encodedData = encodedString!.dataUsingEncoding(NSUTF8StringEncoding)
            
            let attributedOptions : [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
            ]
            
            let attributedString = try! NSAttributedString(data: encodedData!, options: attributedOptions, documentAttributes: nil)
            
            let decodedString = attributedString.string
            cell.descLabel.text = decodedString
        }

        
        cell.nameLable.text = product["name"] as? String
        
        
        let url = NSURL(string: product["thumbnailImage"] as! String)!
        
        cell.prodImageView.setImageWithURL(url)
        
        return cell
        
    }
        
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        
    
        let product = products![indexPath.row]
        
        let productViewController = segue.destinationViewController as! ProductViewController
        
        productViewController.product = product
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
