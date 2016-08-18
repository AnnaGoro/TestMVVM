//
//  ViewController.swift
//  TestMVVM
//
//  Created by Ann Goro on 8/18/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

   @objc  @IBOutlet weak var inputText: UITextField!
   @objc  @IBOutlet weak var colorView: UIView!
   @objc  @IBOutlet weak var NumberLabel:  UILabel!
   
    private let viewModel: TestViewModel = TestViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      _ = NSNotificationCenter.defaultCenter().addObserverForName("Trololo",
                                         object: nil,
                                         queue: nil,
                                         usingBlock: {  _ in
                                            print("addObserverForName")
                                            self.NumberLabel.text = self.viewModel.textToShow
                                            self.colorView.backgroundColor = self.viewModel.colorToShow
                                            print("changing state - observer")
                                            
        })
        
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
      print ("printNotification")
        
        
    }

    @IBAction func enterNumber(sender: UIButton) {
        
        testNumber ()
        
    }
 
    func testNumber () {
        viewModel.textChanged(inputText.text!)
        
          }
}
