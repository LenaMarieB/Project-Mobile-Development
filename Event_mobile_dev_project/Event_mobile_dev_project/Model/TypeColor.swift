import Foundation
import UIKit

enum Type {
    case Meal, Keynote, Panel, Workshop, Networking, Breakout_session
}

func ColorType(type : Type) -> UIColor {
    switch type {
    case .Meal :
            return UIColor.yellow
    case .Keynote :
            return UIColor.red
    case .Panel :
            return UIColor.blue
    case .Workshop :
            return UIColor.white
    case .Networking :
            return UIColor.green
    case .Breakout_session :
            return UIColor.purple
    }

}
