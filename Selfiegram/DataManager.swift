//
//  DataManager.swift
//  Selfiegram
//
//  Created by Trant Solo on 14.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

// depricated code
/*protocol FeedDataManager {
    func getFeed()->AnyObject
}
protocol ProfileDataManager {
    func getProfile()->AnyObject
    func loadProfile()->AnyObject
}*/

class DataManager {
    
    var photoArray:[UIImage] = [#imageLiteral(resourceName: "wow")]
    var testString = "TEST"
    var itemPhotoData:PhotoData?
    
    // Singlenon pattern
    static let sharedInstance = DataManager()
    
        init() {
    
    }
    
    
    /*func takeNewPost() -> PhotoData
    {
        
        itemPhotoData = PhotoData(userName: testString, description: testString, photoImage: photoArray.last!)
        return itemPhotoData!
        
    }*/
    
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
