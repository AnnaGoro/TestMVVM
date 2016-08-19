

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, Delegate  {

     @IBOutlet weak var inputText: UITextField!
     @IBOutlet weak var colorView: UIView!
     @IBOutlet weak var NumberLabel:  UILabel!
   
     private let viewModel: TestViewModel = TestViewModel()
   
     override func viewDidLoad() {
        super.viewDidLoad()
        inputText.delegate = self
        inputText.tag = 1
        viewModel.delegateNotify = self
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
         
        }
 
       //sign in
       viewModel.callback = { [unowned self] color, text in   //react3
            self.colorView.backgroundColor = color
            self.NumberLabel.text = text
       }
 
        testNumber()
    }
    */
        
    }
    
    func delegateNotifyStateChanges(text : String, colour : UIColor) {
    
       changeState ()
    
    }
    
    func changeState () {
      NumberLabel.text = viewModel.textToShow
      colorView.backgroundColor = viewModel.colorToShow
      print ("changeState")
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
         if textField.tag == 1 {
            print ("User finished typing (hit return): hide the keyboard")
            textField.resignFirstResponder()
            return true
         }
         return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing")
         if textField.tag == 1 {
              testNumber ()

        }
    }
    
   
    func textField (inputText : UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        //inputText.resignFirstResponder()
        if inputText.tag == 1 {
    
            testNumber ()
    
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
