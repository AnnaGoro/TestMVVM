//
//  TestViewModel.swift
//  TestMVVM
//
//  Created by Vlad Soroka on 8/18/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import UIKit

class TestViewModel {
    
    var colorToShow: UIColor = UIColor.blackColor()
    var textToShow: String = ""    
    var callback: ( (UIColor, String) -> Void)?
  
    
   func textChanged(newText: String) {
      
        guard let inputNumber = Int(newText) else {
            colorToShow = UIColor.blackColor()
            textToShow = "not a number"
       
            self.callback?(colorToShow, textToShow) // alert
            notify()
            print("TestViewModel textChanged not a number")
          
            return
        }
        
        let number = inputNumber * 3  // handle
        
        textToShow = String(number)
        
        if number % 2 == 0 {
            colorToShow = UIColor.greenColor()  // handle
        }else {
            colorToShow = UIColor.redColor()  // handle
        }
       
        self.callback?(colorToShow, textToShow) // alert
        notify ()
        print("TestViewModel textChanged")
    
    }
    
    func userShookDevice() {
        
        colorToShow = UIColor.yellowColor()  // handle
        textToShow = "You shook device"
        self.callback?(colorToShow, textToShow)
        notify ()
       
        
    }
    
    
    func notify () {
        NSNotificationCenter.defaultCenter().postNotificationName("Trololo", object: nil)
    }
    
}