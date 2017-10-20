//
//  PhotoPostTableViewCell.swift
//  Selfiegram
//
//  Created by Trant Solo on 07.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit


var commentArr:Array<String> = []

class PhotoPostTableViewCell: UITableViewCell {
    
    var userData = PhotoData(userId: 123, photoUrl: "photo", userName: "Vzjuh", descript: "Delaem",  likeCount: 1)
    
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var topStatusLabel: UILabel!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var smallLikeBtn: UIButton!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var likeOverlayImageView: UIImageView!
    @IBOutlet var commentBtn: UIButton!
    
    // Tap on small like btn
    @IBAction func smallLikeBtnTapped(_ sender: Any) {


        if (smallLikeBtn.currentImage == #imageLiteral(resourceName: "post_like")){
            photoWasTapped()
            
        } else if (smallLikeBtn.currentImage == #imageLiteral(resourceName: "post_like_selected")){
            smallLikeBtn.setImage(#imageLiteral(resourceName: "post_like"), for: .normal)
            userData.likeCount -= 1
            likeCountLabel.text = "Likes: \(userData.likeCount)"
        }

        
    }
    
    func updateWithPhotoData(data:PhotoData)
    {
        userNameLabel.text = data.userName!
        topStatusLabel.text = data.descript!
        likeCountLabel.text = "Likes: \(String(describing: data.likeCount))"
        photoImageView.image = UIImage(imageLiteralResourceName: data.photoUrl!)
    }
    
    // MARK: - Handlers
    // Tap on the photo
    func photoWasTapped() {
        if (smallLikeBtn.currentImage == #imageLiteral(resourceName: "post_like")) {
            likeOverlayImageView.isHidden = false
            likeOverlayImageView.alpha = 1
            smallLikeBtn.setImage(#imageLiteral(resourceName: "post_like_selected"), for: .normal)
            userData.likeCount += 1
            likeCountLabel.text = "Likes: \(userData.likeCount)"
            UIView.animate(withDuration: 1, animations: {
                self.likeOverlayImageView.alpha = 0
            }, completion: { finished in
            })
        }
        else {
            likeOverlayImageView.alpha = 1
            likeOverlayImageView.isHidden = true
        }
    }
    // Show Alert, when we tapped on comment btn
//    @IBAction func commentBtnTapped(_ sender: Any) {
//        
//        
//        
//        let commentAlert = UIAlertController(title: "Comemnt",
//                                             message: "Tape your comment",
//                                             preferredStyle: .alert)
//        
//        commentAlert.addTextField { (textField: UITextField) in
//            textField.placeholder = "Your comment"
//        }
//        
//        commentAlert.addAction(UIAlertAction(title: "Ok",
//                                             style: .default,
//                                             handler: { (action: UIAlertAction) in
//                                               self.commentArr.append((commentAlert.textFields?.first?.text)!)
//                                                print("\(self.commentArr)")
//        }))
//        
//        commentAlert.addAction(UIAlertAction(title: "Cancel",
//                                             style: .cancel,
//                                             handler: nil))
//        self.window?.rootViewController?.present(commentAlert, animated: true, completion: nil)
//    
//        
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeOverlayImageView.isHidden = true // Hide our BigLike
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.photoWasTapped))
        photoImageView.addGestureRecognizer(tap)
        
        avatarImageView.maskAsRounded() // Make avatar like Circle
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected state
    }

}
