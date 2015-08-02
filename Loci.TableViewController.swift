//
//  TableViewController.swift
//  Loci
//
//  Created by Jonathan Kingsley on 31/07/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username = NSUserDefaults.standardUserDefaults().valueForKey("username") as! String
        self.title = "Collected Locis"
        let userLabel = UILabel(frame: CGRectMake(10, -40, 370, 90))
        userLabel.text = "Welcome to Loci, \(username)!"
        //self.view.addSubview(userLabel)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .Plain, target: self, action: "createItem")
    }
    
    func createItem() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : CreateViewController = storyboard.instantiateViewControllerWithIdentifier("createItemView") as! CreateViewController
        
        self.presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (NSUserDefaults.standardUserDefaults().valueForKey("notes") as! [AnyObject]).count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        let title = (NSUserDefaults.standardUserDefaults().valueForKey("notes") as! [AnyObject])[indexPath.row][0] as! String
        let subtitle = (NSUserDefaults.standardUserDefaults().valueForKey("notes") as! [AnyObject])[indexPath.row][2] as! String
        let type = (NSUserDefaults.standardUserDefaults().valueForKey("notes") as! [AnyObject])[indexPath.row][1] as! String
        
        
        cell.textLabel?.text = "\(title) (\(type))"

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : DetailViewController = storyboard.instantiateViewControllerWithIdentifier("detailView") as! DetailViewController
        vc.data = (NSUserDefaults.standardUserDefaults().valueForKey("notes") as! [AnyObject])[indexPath.row] as! [String]
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
}
