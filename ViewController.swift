
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
        inputText.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
      _ = NSNotificationCenter.defaultCenter().addObserverForName("Trololo",
                                         object: nil,
                                         queue: nil,
                                         usingBlock: {  _ in
                                            self.NumberLabel.text = self.viewModel.textToShow
                                            self.colorView.backgroundColor = self.viewModel.colorToShow
        })
        
        //sign in
       viewModel.callback = { [unowned self] color, text in   //react3
            self.colorView.backgroundColor = color
            self.NumberLabel.text = text
       }
       testNumber()
    }

    func delegateNotifyStateChanges(text : String, colour : UIColor) {
        changeState ()
    }
    
    func changeState () {
      NumberLabel.text = viewModel.textToShow
      colorView.backgroundColor = viewModel.colorToShow
    }
    
    func textFieldDidChange(textField: UITextField) {
       testNumber ()
    }

    @IBAction func enterNumber(sender: UIButton) {
        testNumber ()
    }
 
    func testNumber () {
        viewModel.textChanged(inputText.text!)        
    }
}
