
import UIKit

//UITextFieldDelegate, Delegate
class ViewController: UIViewController, UITextFieldDelegate {

     @IBOutlet weak var inputText: UITextField!
     @IBOutlet weak var colorView: UIView!
     @IBOutlet weak var NumberLabel:  UILabel!
     private let viewModel: TestViewModel = TestViewModel()
     private let keyPathColorToShow = "colorToShow"
     private let keyPathTextToShow = "textToShow"
     override func viewDidLoad() {
        super.viewDidLoad()
       // inputText.delegate = self
       // viewModel.delegateNotify = self
        
        viewModel.addObserver(self,
                              forKeyPath: "colorToShow",
                              options: .New,
                              context: nil)
        viewModel.addObserver(self,
                              forKeyPath: "textToShow",
                              options: .New,
                              context: nil)
        
        inputText.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        /*
      _ = NSNotificationCenter.defaultCenter().addObserverForName("Trololo",
                                         object: nil,
                                         queue: nil,
                                         usingBlock: {  _ in
                                            self.NumberLabel.text = self.viewModel.textToShow
                                            self.colorView.backgroundColor = self.viewModel.colorToShow
        })
        */
        //sign in
       viewModel.callback = { [unowned self] color, text in   //react3
            self.colorView.backgroundColor = color
            self.NumberLabel.text = text
       }
       testNumber()
    }
   
    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        switch keyPath {
        case "colorToShow":  if let color = UIColor?(change?[NSKeyValueChangeNewKey] as! UIColor) {
                colorView.backgroundColor = color
                print("colorToShow")}
        case "textToShow" :
            if let strNumber = String?(change?[NSKeyValueChangeNewKey] as! String) {
                NumberLabel.text = strNumber 
                print("textToShow")}
        default: break
        }
    }
    
    
   // deinit {
   //     objectToObserve.removeObserver(self, forKeyPath: "colorToShow", context: nil)
   // }
    
    /*
    func delegateNotifyStateChanges(text : String, colour : UIColor) {
        changeState ()
    }
    */
    
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
