

import Foundation
import UIKit

protocol Delegate : NSObjectProtocol {
    func delegateNotifyStateChanges(text : String, colour : UIColor)
}