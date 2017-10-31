//
//  DataManager.swift
//  Selfiegram
//
//  Created by Trant Solo on 14.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit


class DataManager {
    
    var photoArray:[UIImage] = [#imageLiteral(resourceName: "wow")]
    var testString = "TEST"
    var itemPhotoData:PhotoData?
    
    // Singlenon pattern
    static let sharedInstance = DataManager()
    
        init() {
    
    }
    
    func getPhotoData() -> PhotoData
    {
        return itemPhotoData!
    }
    
    // MARK: - API

    func getFeed(complete: @escaping (_ data:[AnyObject]) -> ()) {

    }
    
    func getProfile(complete: @escaping (_ data:[AnyObject]) -> ()) {
        
    }

}
