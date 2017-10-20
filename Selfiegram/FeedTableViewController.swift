//
//  FeedTableViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 06.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit
import CoreData
import WatchConnectivity

class FeedTableViewController: UITableViewController, WCSessionDelegate {
    
    var watchPostCount = 0
    @IBOutlet var feedTableView: UITableView!
    private var watchSession:WCSession?
    var posts:[PhotoData] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        if WCSession.isSupported() {
            watchSession = WCSession.default()
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    func getNetworkData()
    {
        NetworkDataManager.networkSharedInstance.getFeed { data in
            self.posts = data as! [PhotoData]
            self.feedTableView.reloadData()
            for post in self.posts {
                let postContext = PhotoDataCD(context: PersistenceService.context)
                postContext.descript = post.descript
                postContext.likeCount = Int32(post.likeCount)
                postContext.photoUrl = post.photoUrl
                postContext.userId = Int32(post.userId!)
                postContext.userName = post.userName
                PersistenceService.saveContext()
            }
        }
    }
    
    func getCoreData()
    {
        // Feed
        if self.posts.count == 0 {
            let fetchRequest:NSFetchRequest<PhotoDataCD> = PhotoDataCD.fetchRequest()
            do {
                let posts = try PersistenceService.context.fetch(fetchRequest)
                if posts.count > 10 {
                    var i = posts.count - 1
                    while i != posts.count - 11 {
                        let photoData = PhotoData(userId: Int(posts[i].userId), photoUrl: posts[i].photoUrl!, userName: posts[i].userName!, descript: posts[i].descript!, likeCount: Int(posts[i].likeCount))
                        self.posts.append(photoData)
                        i -= 1
                    }
                } else {
                for post in posts {
                    let photoData = PhotoData(userId: Int(post.userId), photoUrl: post.photoUrl!, userName: post.userName!, descript: post.descript!, likeCount: Int(post.likeCount))
                    self.posts.append(photoData)
                    }
                }
            } catch { print("FETCH ERROR") }
        } else {}
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNetworkData()
        getCoreData()
        feedTableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {  // numberOfRowsInSection - how much section in this cell
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoPostTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.updateWithPhotoData(data: posts[indexPath.row])
        
        return cell
    }
}

extension FeedTableViewController {
    
        func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//            print("iPhone has got a message \(message)")
//            let indexPath = feedTableView.indexPathForSelectedRow
//            let image = UIImage(named: posts[(indexPath?.row)!].photoUrl!)
//            let data = UIImageJPEGRepresentation(image!, 0.1)
//            session.sendMessageData(data!, replyHandler: nil) { (error) in
//                print("☹️ \(error) | \(String(describing: image?.size)) | \(String(describing: data?.count))")
//            }
//            if (message.index(forKey: "Like") != nil) {
//                posts[(indexPath?.row)!].likeCount += 1
//            }
//            else { }
            print("iPhone has got a message \(message)")
            if watchPostCount <= posts.count {
                let post = posts[watchPostCount]
                let image = UIImage(named: (post.photoUrl!))
                let data = UIImageJPEGRepresentation(image!, 0.1)
                session.sendMessageData(data!, replyHandler: nil) { (error) in
                    print("☹️ \(error) | \(String(describing: image?.size)) | \(String(describing: data?.count))")
                }
                if (message.index(forKey: "Like") != nil) {
                    post.likeCount += 1
                }
                else { }
                watchPostCount += 1
            }
        }
        
        func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
            
        }
        
        func sessionDidBecomeInactive(_ session: WCSession) {
            
        }
        
        func sessionDidDeactivate(_ session: WCSession) {
            
        }
}
