//
//  ViewController.swift
//  Loci
//
//  Created by Jonathan Kingsley on 28/07/2015.
//  Copyright (c) 2015 WhenSushiAttacks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var username: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "username")
        // Do any additional setup after loading the view, typically from a nib.
        // https://github.com/jpsim/PeerKit
        
        self.view.backgroundColor = UIColor(red:0.17, green:0.78, blue:0.36, alpha:1)
        
        let logoView = UIImageView(image: UIImage(named: "Icon"))
        logoView.frame = CGRectMake(self.view.center.x - 71, 120, 143, 77)
        self.view.addSubview(logoView)
        
        let desc = UILabel(frame: CGRectMake(5, 200, 370, 90))
        desc.numberOfLines = 3
        desc.textColor = UIColor.whiteColor()
        desc.textAlignment = .Center;
        desc.text = "Loci is a gesture-based platform for sharing data. Please enter your username to get started."
        self.view.addSubview(desc)
        
        username = UITextField(frame: CGRectMake(80, 300, 210, 30))
        username.text = "Username"
        username.backgroundColor = UIColor.whiteColor()
        username.textColor = UIColor.lightGrayColor()
        username.clipsToBounds = true
        username.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        username.layer.cornerRadius = 5.0
        username.delegate = self
        username.becomeFirstResponder()
        self.view.addSubview(username)
        
        let loginButton = AYVibrantButton(frame: CGRectMake(80, 350, 210, 40), style:AYVibrantButtonStyleInvert)
        loginButton.vibrancyEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: .ExtraLight))
        loginButton.text = "Login"
        loginButton.font = UIFont.systemFontOfSize(18.0)
        loginButton.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(loginButton)
    }
    
    func login() {
        let login = username.text.lowercaseString
        
        if login == "" || login == "username" { return; }
        
        if(login == "jon" || login == "alex") {
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : TableViewController = storyboard.instantiateViewControllerWithIdentifier("mainInfoView") as! TableViewController
            NSUserDefaults.standardUserDefaults().setObject(login, forKey: "username")
            
            let navigationController = UINavigationController(rootViewController: vc)
            
            self.presentViewController(navigationController, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Error!", message: "This user does not exist.", preferredStyle: UIAlertControllerStyle.Alert)
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        login()
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "btnSubmitSegue") {
            var svc = segue.destinationViewController as! TableViewController
            svc.username = username.text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

