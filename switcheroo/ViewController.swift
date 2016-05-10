//
//  ViewController.swift
//  switcheroo
//
//  Created by swilson on 7/29/15.
//  Copyright (c) 2015 swilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GrayReturneeDelegate {

    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var whiteTextField: UITextField!
    @IBOutlet weak var whiteLabel: UILabel!
    var whiteLabelText:String = ""
    
    @IBAction func clickLocalizedTextButton(sender: UIButton) {
      let alertController = UIAlertController(title: "!!!", message: NSLocalizedString("USA English", comment:""), preferredStyle: .Alert)
      
      let okAction = UIAlertAction(title: "OK", style: .Default) {
        (action) in
      }
      alertController.addAction(okAction)
      
      self.presentViewController(alertController, animated: true) {
      }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.whiteLabel.text = self.whiteLabelText
      
        centerButton.setTitle( NSLocalizedString("USA English", comment:""), forState: .Normal)
      
        // Set bg color different when running snapshot
        var screenshotInArgs = false;
        var arguments:[AnyObject] = NSProcessInfo.processInfo().arguments
        for arg in arguments {
          let stringarg:String? = arg as? String
          if stringarg == "-FASTLANE_SNAPSHOT" {
            print("BEING RUN BY FASTLANE SNAPSHOT")
            screenshotInArgs = true
            break
          }
        }
        if screenshotInArgs == true {
            self.view.backgroundColor = UIColor.orangeColor()
        }
      
    }
    
    @IBAction func endGray(segue:UIStoryboardSegue) {
        let grayController = segue.sourceViewController as! GreyController
        // We can do this because we know the white controller already exists.
        self.whiteLabel.text = grayController.grayTextField.text
    }

    
    @IBAction func sendToGray(sender: UIButton) {
        let grayVC:GreyController = self.storyboard?.instantiateViewControllerWithIdentifier("grayVC") as! GreyController
        grayVC.senderController = self
        grayVC.grayLabelText = self.whiteTextField.text!
        
        self.showViewController(grayVC, sender: sender)
    }
    
    func setLabelMessage(message: String) {
        self.whiteLabel.text = message
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

