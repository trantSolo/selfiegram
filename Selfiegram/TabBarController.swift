//
//  TabBarController.swift
//  Selfiegram
//
//  Created by Trant Solo on 06.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit
import CoreData

class TabBarController: UITabBarController {
    
//    private var watchSession:WCSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBar Customize
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.000, green: 0.671, blue: 0.945, alpha: 1.00)
        navigationController?.navigationBar.tintColor = UIColor.white
        addNavBarItem()
        
        // Let do tab icons in Constants
        
        let feedvc = viewControllers![0]
        let camvc = viewControllers![1]
        let profvc = viewControllers![2]
        let font = UIFont(name: "HelveticaNeue", size: 12)  // It is the constant for a our font
        
        // Now we doing all images on tab icons is white(originals)
        
        feedvc.tabBarItem.image  = UIImage(named: "tab_feed_icon")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        camvc.tabBarItem.image  = UIImage(named: "tab_camera_icon")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        profvc.tabBarItem.image  = UIImage(named: "tab_profile_icon")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        // Now we doing settings for our text
        
        feedvc.tabBarItem!.setTitleTextAttributes([NSFontAttributeName: font!, NSForegroundColorAttributeName: UIColor.white], for: UIControlState.normal)
        camvc.tabBarItem!.setTitleTextAttributes([NSFontAttributeName: font!, NSForegroundColorAttributeName: UIColor.white], for: UIControlState.normal)
        profvc.tabBarItem!.setTitleTextAttributes([NSFontAttributeName: font!, NSForegroundColorAttributeName: UIColor.white], for: UIControlState.normal)
        
        // And now we change color of our tab bar to white color
        
        UITabBar.appearance().tintColor = UIColor.white
        
        // Sdvigaem image on the tab icons
        
        feedvc.tabBarItem!.imageInsets = UIEdgeInsets(top: 5, left: -30, bottom: -5, right: 30)
        camvc.tabBarItem!.imageInsets = UIEdgeInsets(top: 7, left: -35, bottom: -7, right: 35)
        profvc.tabBarItem!.imageInsets = UIEdgeInsets(top: 5, left: -30, bottom: -5, right: 30)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TabBarController {

    func updateNavBarTitle(text:String)
    {
        navigationController?.navigationBar.topItem?.title = text
    }
    
    func showSettings()
    {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SettingsSVC")
        present(viewController, animated: true, completion: nil)
    }
    
    func addNavBarItem()
    {
        let barItem = UIBarButtonItem(image: UIImage(named: "settings_icon"), style: .plain, target: self, action: #selector(TabBarController.showSettings))
        navigationController?.navigationBar.topItem?.setRightBarButton(barItem, animated: false)
        
        // Nickname
        let fetchRequest:NSFetchRequest = UserNickName.fetchRequest()
        do {
            let nickNames = try PersistenceService.context.fetch(fetchRequest)
            if nickNames.count > 0 {
                let nickName = nickNames.last?.nickName
                updateNavBarTitle(text: nickName!)
            } else {
                PersistenceService.saveContext()
            }
        } catch { print("FETCH ERROR") }
    }
}
