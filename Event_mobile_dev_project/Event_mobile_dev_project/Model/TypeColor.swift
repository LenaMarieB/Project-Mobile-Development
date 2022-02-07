import Foundation
import UIKit

enum Type {
    case Meal, Keynote, Panel, Workshop, Networking, Breakout_session
}

func ColorType(type : Type){
    case Meal :
        return UIColor.yellowColor()
    case Keynote :
        return UIColor.redColor()
    case Panel :
        return UIColor.blueColor()
    case Workshop :
        return UIColor.pinkColor()
    case Networking :
        return UIColor.greenColor()
    case Breakout_session :
        return UIColor.purpleColor()


}