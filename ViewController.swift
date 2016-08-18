//
//  ViewController.swift
//  TestMVVM
//
//  Created by Ann Goro on 8/18/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate  {

     @IBOutlet weak var inputText: UITextField!
     @IBOutlet weak var colorView: UIView!
     @IBOutlet weak var NumberLabel:  UILabel!
   
    private let viewModel: TestViewModel = TestViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputText.delegate = self
        inputText.tag = 1
        /*
      _ = NSNotificationCenter.defaultCenter().addObserverForName("Trololo",
                                         object: nil,
                                         queue: nil,
                                         usingBlock: {  _ in
                                            print("addObserverForName")
                                            self.NumberLabel.text = self.viewModel.textToShow
                                            self.colorView.backgroundColor = self.viewModel.colorToShow
                                            print("changing state - observer")
                                            
        })
        */
       //sign in
       viewModel.callback = { [unowned self] color, text in   //react3
            self.colorView.backgroundColor = color
            self.NumberLabel.text = text
       }
 
        testNumber()
    }
    
    
    func changeState () {
      NumberLabel.text = viewModel.textToShow
      colorView.backgroundColor = viewModel.colorToShow
      print ("changeState")
        
        
    }
    
   // func textFieldShouldReturn(textField: UITextField) -> Bool {
        // User finished typing (hit return): hide the keyboard.
       // textField.resignFirstResponder()
     //   return true
    //}
    
    func textFieldDidEndEditing(textField: UITextField) {
        print(textFieldDidEndEditing)
         //inputText.resignFirstResponder()
         if textField.tag == 1 {
            self.NumberLabel.text = inputText.text
            self.colorView.backgroundColor = UIColor.blueColor()

        }
    }
    
    func textField(inputText: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        //inputText.resignFirstResponder()
        if inputText.tag == 1 {
            testNumber ()
            //changeState ()
            
        }

        return true;
    }
    
    @IBAction func enterNumber(sender: UIButton) {
        
        testNumber ()
        
    }
 
    func testNumber () {
        viewModel.textChanged(inputText.text!)
        
          }
}
