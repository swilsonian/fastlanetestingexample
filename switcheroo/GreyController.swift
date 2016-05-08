//
//  GreyController.swift
//  switcheroo
//
//  Created by swilson on 7/29/15.
//  Copyright (c) 2015 swilson. All rights reserved.
//

import UIKit

protocol GrayReturneeDelegate {
    func setLabelMessage(message: String)
}

class GreyController: UIViewController {
    

    @IBOutlet weak var grayLabel: UILabel!
    @IBOutlet weak var grayTextField: UITextField!
    var grayLabelText: String = ""
    
    var senderController: GrayReturneeDelegate? = nil
   
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        grayLabel.text = grayLabelText
    }
    
    @IBAction func returnToWhite(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        self.senderController?.setLabelMessage(self.grayTextField!.text!)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let whiteController = segue.destinationViewController as! ViewController
        
        // We can do this because we know the white controller already exists.
        whiteController.whiteLabel.text = grayTextField.text
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
