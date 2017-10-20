//
//  SplitVIewTableViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 14.10.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

class SplitVIewTableViewController: UITableViewController {
    
    var data = ["Nick Name", "About", "Ok"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func showMain()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainNC")
        present(viewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            let indexPath = tableView.indexPathForSelectedRow
            let destinationVC = segue.destination as! DetailViewController
            if let indexPath = indexPath {
                if data[indexPath.row] == "Ok" {
                    showMain()
                } else {
                    destinationVC.status = data[indexPath.row]
                }
            }
        }
    }
}
