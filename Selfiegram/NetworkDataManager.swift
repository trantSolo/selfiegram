//
//  NetwotkDataMAnager.swift
//  Selfiegram
//
//  Created by Trant Solo on 19.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NetworkDataManager:DataManager {
    
    static let networkSharedInstance = NetworkDataManager()
    
    private override init() {
        super.init()
    }
    
    override func getFeed(complete: @escaping (_ data:[AnyObject]) -> ()) {
        Alamofire.request("http://127.0.0.1:9080/feed").responseJSON { response in
            if let j = response.result.value {
                print(j)
                let json = JSON(j)
                var postArr = [PhotoData]()
                for obj in json["posts"] {
                    let postData = PhotoData(userId: obj.1["userId"].int!, photoUrl: obj.1["photoUrl"].string!, userName: obj.1["userName"].string!, descript: obj.1["descript"].string!, likeCount: obj.1["likeCount"].int!)
                    postArr.append(postData)
                }
                complete(postArr)
            }
        }
    }
    
    override func getProfile(complete: @escaping (_ data:[AnyObject]) -> ()) {
        Alamofire.request("http://127.0.0.1:9080/profile").responseJSON { response in
            if let j = response.result.value {
                let json = JSON(j)
                var arr:[String] = []
                for obj in json["photos"] {
                    arr.append(obj.1.string!)
                }
                complete(arr as [AnyObject])
            }
            
        }

    }
    
}
