//
//  EventCell.swift
//  Event_mobile_dev_project
//
//  Created by Camille Omnes on 31/01/2022.
//

import Foundation
import UIKit

class EventCell : UITableViewCell {
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var event: Event?
        
    func setUpCell(event: Event) {
        
        self.event = event
        
        self.eventLabel.text = event.fields.activity;
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = event.fields.start {
            if let d = formatter.date(from: date) {
                self.timeLabel.text = String(NSCalendar.current.component(.hour, from: d as Date)) + "h" + String(NSCalendar.current.component(.minute, from: d as Date));
            } else {
                print("error while converting date")
            }
        }
        
        if let topic = event.fields.topic {
            self.typeLabel.text = StringToType(text: topic.first!).rawValue;
        }
        
        self.eventLabel.textColor = UIColor.init(red: 0.749, green: 0.235, blue: 0.122, alpha: 1);
        self.timeLabel.textColor = UIColor.black;
        self.typeLabel.textColor = UIColor.white;
        self.timeLabel.font = UIFont.boldSystemFont(ofSize: 16.0);

        //self.typeLabel.backgroundColor = ColorType(type : event.fields.topic?.first);
        self.typeLabel.layer.cornerRadius = 8;
        self.typeLabel.layer.borderWidth = 2;
        //self.typeLabel.layer.borderColor = ColorType(type: event.fields.topic?.first).cgColor;
        self.typeLabel.layer.masksToBounds = true;

        self.backgroundColor = UIColor.init(red: 0.976, green: 0.882, blue: 0.863, alpha: 1);
    }
}
