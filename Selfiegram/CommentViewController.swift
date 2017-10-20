//
//  CommentViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 13.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

// Class for comments
class CommentViewController: UIViewController {

    @IBOutlet var commentTextView: UITextView!
    @IBOutlet var commentCancelBtn: UIButton!
    @IBOutlet var commentOkBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // Return to cell
    @IBAction func commendCancelBtnTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    // Save comment and return to cell
    @IBAction func commentOkBtnTapped(_ sender: Any) {
        let commentText = commentTextView.text
        if commentText?.trim() == "" {
            _ = navigationController?.popViewController(animated: true)
        } else {
            commentArr.append(commentText!)
            print("\(commentArr)")
            _ = navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
