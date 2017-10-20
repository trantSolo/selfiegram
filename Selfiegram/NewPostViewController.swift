//
//  NewPostViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 13.10.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {

    
    @IBOutlet var newPostImageView: UIImageView!
    var segueImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPostImageView.image = segueImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
