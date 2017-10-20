//
//  PhotoData.swift
//  Selfiegram
//
//  Created by Trant Solo on 06.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

class PhotoData {
    
    var userId:Int?
    var photoUrl:String?
    var userName:String?
    var descript:String?
    //var date:NSDate?
    var likeCount = 0

    init(userId:Int, photoUrl:String, userName:String, descript:String, likeCount:Int)
    {
        self.userId = userId
        self.photoUrl = photoUrl
        self.userName = userName
        self.descript = descript
        //self.date = date
        self.likeCount = likeCount
    }
    
}
