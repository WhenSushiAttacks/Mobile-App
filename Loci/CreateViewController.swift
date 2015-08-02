//
//  CreateViewController.swift
//  Loci
//
//  Created by Jonathan Kingsley on 02/08/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {
    var titleField: UITextField!
    var descriptionField: UITextView!
    var typeField: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red:0.17, green:0.78, blue:0.36, alpha:1)
        self.title = "Create Item"
        let desc = UILabel(frame: CGRectMake(5, 50, 370, 90))
        desc.numberOfLines = 3
        desc.textColor = UIColor.whiteColor()
        desc.textAlignment = .Center;
        desc.text = "To create a new Loci, simply fill in the form below."
        self.view.addSubview(desc)
        
        titleField = UITextField(frame: CGRectMake(90, 130, 210, 30))
        titleField.text = "Title"
        titleField.backgroundColor = UIColor.whiteColor()
        titleField.textColor = UIColor.lightGrayColor()
        titleField.clipsToBounds = true
        titleField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        titleField.layer.cornerRadius = 5.0
        titleField.delegate = self
        titleField.becomeFirstResponder()
        self.view.addSubview(titleField)
        
        descriptionField = UITextView(frame: CGRectMake(45, 200, 300, 200))
        descriptionField.text = "Description"
        descriptionField.backgroundColor = UIColor.whiteColor()
        descriptionField.textColor = UIColor.lightGrayColor()
        descriptionField.layer.cornerRadius = 5.0
        self.view.addSubview(descriptionField)
        
        let items = ["Open", "General", "Private"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 1
        customSC.setEnabled(false, forSegmentAtIndex: 0)
        customSC.frame = CGRectMake(90, 168, 210, 20)
        customSC.layer.cornerRadius = 5.0
        customSC.addTarget(self, action: "changeType", forControlEvents: .ValueChanged)
        self.view.addSubview(customSC)
        
        let addButton = AYVibrantButton(frame: CGRectMake(90, 407, 210, 40), style:AYVibrantButtonStyleInvert)
        addButton.vibrancyEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: .ExtraLight))
        addButton.text = "Add Item"
        addButton.font = UIFont.systemFontOfSize(18.0)
        addButton.addTarget(self, action: Selector("addItem"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addButton)
    }
    
    func changeType() {}
    
    func addItem() {
        if(titleField.text != "" || descriptionField.text != "") {
            
            var notes = NSUserDefaults.standardUserDefaults().valueForKey("notes") as! [AnyObject]
            notes.append([titleField.text, "text", descriptionField.text, "\(notes.count + 1)"])
            NSUserDefaults.standardUserDefaults().setObject(notes, forKey: "notes")
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : TableViewController = storyboard.instantiateViewControllerWithIdentifier("mainInfoView") as! TableViewController
            
            let navigationController = UINavigationController(rootViewController: vc)
            
            self.presentViewController(navigationController, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Error!", message: "You haven't filled in all the options", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.textColor == UIColor.lightGrayColor() {
            textField.text = nil
            textField.textColor = UIColor.blackColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
