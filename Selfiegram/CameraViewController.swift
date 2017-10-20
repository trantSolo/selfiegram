//
//  CameraViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 19.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // UI
    @IBOutlet var cameraImageVIew: UIImageView!
    
    @IBOutlet var useFiltersButton: UIButton!
    @IBOutlet var newPostButton: UIButton!
    @IBOutlet var cameraPrepareLabel: UILabel!
    
    var imagePicker:UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*let cameraItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                      target: self,
                                      action: #selector(self.takePhotoFromCamera(_:)))
        let photoLibItem = UIBarButtonItem(title: "Photo Lib",
                                           style: .plain,
                                           target: self,
                                           action: #selector(self.takePhotoFromLibrary(_:)))
        navigationController?.navigationBar.topItem?.setRightBarButton(cameraItem, animated: false)
        navigationController?.navigationBar.topItem?.setLeftBarButton(photoLibItem, animated: false)*/
        
        showHiddenButtons()
    }
    
    @IBAction func takePhotoButton(_ sender: UIButton) {
        takePhotoFromCamera((Any).self)
    }
    
    func showHiddenButtons()
    {
        if cameraImageVIew.image != nil {
            useFiltersButton.isHidden = false
            newPostButton.isHidden = false
            cameraPrepareLabel.isHidden = true
        } else {
            useFiltersButton.isHidden = true
            newPostButton.isHidden = true
            cameraPrepareLabel.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Handlers
    
    func takePhotoFromCamera(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        imagePicker!.delegate = self
        imagePicker!.sourceType = .camera
        self.present(imagePicker!, animated: true, completion: nil)
        
    }
    
    func takePhotoFromLibrary(_ sender: Any) {
        
        imagePicker = UIImagePickerController()
        imagePicker!.delegate = self
        imagePicker!.sourceType = .photoLibrary
        self.present(imagePicker!, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker?.dismiss(animated: true) {}
        cameraImageVIew.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        DataManager.sharedInstance.photoArray.append((info[UIImagePickerControllerOriginalImage] as? UIImage)!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FilterSegue" {
            let destinationVC = segue.destination as! FIlterViewController
                destinationVC.segueImage = self.cameraImageVIew.image!
        } else
        if segue.identifier == "NewPostSegue" {
            let destinationVC = segue.destination as! NewPostViewController
            destinationVC.segueImage = self.cameraImageVIew.image!
        }
    }

}
