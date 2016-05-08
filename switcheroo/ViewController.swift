//
//  ViewController.swift
//  switcheroo
//
//  Created by swilson on 7/29/15.
//  Copyright (c) 2015 swilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GrayReturneeDelegate {

    @IBOutlet weak var whiteTextField: UITextField!
    @IBOutlet weak var whiteLabel: UILabel!
    var whiteLabelText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.whiteLabel.text = self.whiteLabelText
        
    }
    
    @IBAction func endGray(segue:UIStoryboardSegue) {
        print("heyooo", terminator: "")
        //var whiteController = segue.destinationViewController as! ViewController
        let grayController = segue.sourceViewController as! GreyController
        // We can do this because we know the white controller already exists.
        self.whiteLabel.text = grayController.grayTextField.text
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let grayController = segue.destinationViewController as! GreyController
        grayController.grayLabelText = self.whiteTextField.text!
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

