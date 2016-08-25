

import UIKit
import RxSwift

struct TestViewModel  {
    
    let colorToShow: Variable <UIColor> = Variable( UIColor.blackColor() )
    let textToShow: Variable <String> = Variable( "" )

    private let bag = DisposeBag()
    
    var textChangedObservable: Observable<String>? {
        didSet {
            guard let observalbe = textChangedObservable else { return }
            
            let intOptionalObservalbe: Observable<Int?> =
                observalbe.map { (text: String) -> Int? in
                    return Int(text)
                }
            
                intOptionalObservalbe
                    .map { (maybeInt) -> String in
                        guard let int = maybeInt else {
                            return "not a number"
                        }
                        
                        return String(int * 3)
                    }
                    .subscribeNext { (text) in
                        self.textToShow.value = text
                    }
                    
            intOptionalObservalbe
                .map { (maybeInt) -> UIColor in
                    guard let int = maybeInt else {
                        return UIColor.blackColor()
                    }
                    
                    return int % 2 == 0 ?
                        UIColor.greenColor() :
                        UIColor.redColor()
                    
                }
                .subscribeNext { (color) in
                    self.colorToShow.value = color
                }
            
        }
        
    
    }
    
}