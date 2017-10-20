//
//  DetailViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 16.10.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var status = ""
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var saveNickNameButton: UIButton!
    
    @IBOutlet var aboutImageView: UIImageView!
    @IBOutlet var aboutTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch status {
            case "Nick Name":
                nickNameTextField.isHidden = false
                saveNickNameButton.isHidden = false
            case "About":
                aboutImageView.isHidden = false
                aboutTextLabel.isHidden = false
            default: break
        }

    }
    
    @IBAction func saveNickNameButtonTapped(_ sender: UIButton) {
        if nickNameTextField.text?.trim() != "" {
            let nickName = nickNameTextField.text!.trim()
            self.navigationController?.navigationBar.topItem?.title = nickName
            let userNickName = UserNickName(context: PersistenceService.context)
            userNickName.nickName = nickName
            PersistenceService.saveContext()
            let alert = UIAlertController(title: "Nickname was changed",
                                          message: "Now you'r nickname is \(String(describing: nickName))",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
//    func showAlert()
//    {
//        let alert = UIAlertController(title: "Your nickname",
//                                      message: "Come up with a unique",
//                                      preferredStyle: .alert)
//        let action = UIAlertAction(title: "Save", style: .default) { (action) in
//            let textField = alert.textFields?[0]
//            let nickName = textField?.text
//            self.navigationController?.navigationBar.topItem?.title = nickName
//            let userNickName = UserNickName(context: PersistenceService.context)
//            userNickName.nickName = nickName
//            PersistenceService.saveContext()
//        }
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alert.addTextField { (textField) in }
//        alert.addAction(cancel)
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
