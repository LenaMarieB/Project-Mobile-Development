import Foundation
import UIKit

enum Type : String {
    case Meal, Keynote, Panel, Workshop, Networking, Breakout_session, None
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
    case .None:
        return UIColor.black
    }

}

func StringToType(text: String) -> Type {
    switch text {
    case "Meal" :
        return .Meal
    case "Keynote" :
        return .Keynote
    case "Panel" :
        return .Panel
    case "Workshop" :
        return .Workshop
    case "Networking" :
        return .Networking
    case "Breakout session" :
        return .Breakout_session
    default:
        return .None
    }}
