
import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var NumberLabel:  UILabel!
    
    private var viewModel: TestViewModel = TestViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.textChangedObservable = inputText.rx_text.asObservable()
        
        viewModel.colorToShow.asObservable()
            .subscribeNext { (colour: UIColor) -> Void in
                self.colorView.backgroundColor = colour
            }
            .addDisposableTo(bag)
        
        viewModel.textToShow.asObservable()
            .subscribeNext { (textToShow: String) -> Void in
                self.NumberLabel.text = textToShow
            }
            .addDisposableTo(bag)
    }
    
    
    
    
    
}
