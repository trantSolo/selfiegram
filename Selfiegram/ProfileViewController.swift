//
//  ProfileViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 04.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet var profileCollectionView: UICollectionView!
    
    var photos:[String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        let size = view.frame.width / 3
        layout.itemSize = CGSize(width: size, height: size)
        layout.sectionInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        profileCollectionView.setCollectionViewLayout(layout, animated: false)
        profileCollectionView.backgroundColor = profileCollectionView.backgroundColor?.withAlphaComponent(0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNetworkData()
        profileCollectionView.reloadData()
    }
    
    func getNetworkData()
    {
        NetworkDataManager.networkSharedInstance.getProfile() {data in
            self.photos = data as! [String]
            self.profileCollectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProfilePhotoPostCollectionViewCell
        cell.imageView.image = UIImage.init(imageLiteralResourceName: photos[indexPath.row])
        return cell
    }
}
