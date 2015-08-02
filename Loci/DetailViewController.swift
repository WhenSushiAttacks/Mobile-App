//
//  DetailViewController.swift
//  Loci
//
//  Created by Jonathan Kingsley on 02/08/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var data: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red:0.17, green:0.78, blue:0.36, alpha:1)
        
        let titleLayer = UILabel(frame: CGRectMake(90, 130, 210, 30))
        titleLayer.text = "Title: \(data[0])"
        self.view.addSubview(titleLayer)
        
        let descLayer = UILabel(frame: CGRectMake(90, 160, 210, 100))
        descLayer.text = "Description: \(data[2])"
        self.view.addSubview(descLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
