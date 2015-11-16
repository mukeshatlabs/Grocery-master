//
//  ProductViewController.swift
//  Grocery
//
//  Created by Mukesh Jain on 11/5/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    var product: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text  = product["name"] as! String
        
        descLabel.text = ""

        
        let encodedString = product["shortDescription"] as? String
        
        if encodedString != nil {
            let encodedData = encodedString!.dataUsingEncoding(NSUTF8StringEncoding)
            
            let attributedOptions : [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
            ]
            
            let attributedString = try! NSAttributedString(data: encodedData!, options: attributedOptions, documentAttributes: nil)
            
            let decodedString = attributedString.string
            descLabel.text = decodedString
        }
        
        
        let url = NSURL(string: product["thumbnailImage"] as! String)!
        
        productImage.setImageWithURL(url)
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

}
