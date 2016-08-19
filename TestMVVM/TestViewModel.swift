

import UIKit

class TestViewModel {
    
    var colorToShow: UIColor = UIColor.blackColor()
    var textToShow: String = ""    
    var callback: ( (UIColor, String) -> Void)?
    weak var delegateNotify : Delegate?
    func textChanged(newText: String) {
      
        guard let inputNumber = Int(newText) else {
            colorToShow = UIColor.blackColor()
            textToShow = "not a number"
            notify()
            return
        }
        
        let number = inputNumber * 3  // handle
        textToShow = String(number)
        
        if number % 2 == 0 {
            colorToShow = UIColor.greenColor()  // handle
        }else {
            colorToShow = UIColor.redColor()  // handle
        }
        notify()
    }
    
    func userShookDevice() {
        colorToShow = UIColor.yellowColor()  // handle
        textToShow = "You shook device"
        notify()
       }
    
    
    private func notify () {
        delegateNotify?.delegateNotifyStateChanges (textToShow, colour: colorToShow)
        NSNotificationCenter.defaultCenter().postNotificationName("Trololo", object: nil)
        self.callback?(colorToShow, textToShow)
   }
    
}